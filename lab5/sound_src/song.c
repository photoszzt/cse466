#include <stdlib.h>
#include <alsa/asoundlib.h>
#include <arpa/inet.h>
#include <stdint.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include "audio_interface.h"
#include "sin_table.h"
#include "amplitude_table.h"

#define BUFFER_SIZE 20000
#define NOTE_BUFFER 20

static snd_pcm_t *playback_handle;

int get_frequencies_and_durations(FILE *, uint16_t *, uint16_t *, int); 
void play_note(uint16_t, uint16_t); 

int main(int argc, char **argv) {

  if(argc != 2) {
    fprintf(stderr, "Usage: %s <song_file>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  char *filename = argv[1];
  set_up_sound(&playback_handle, SND_PCM_FORMAT_S16_BE, 1, 44100);
  FILE *fp = fopen(filename, "r");
  uint16_t frequencies[NOTE_BUFFER];
  uint16_t durations[NOTE_BUFFER];
  int continuing = 1;
  while(continuing) {
    continuing = get_frequencies_and_durations(fp, frequencies, durations, NOTE_BUFFER);
    for(int i = 0; i < NOTE_BUFFER; i++) {
      play_note(frequencies[i], durations[i]);
    }
  }
}

int get_frequencies_and_durations(FILE *fp, uint16_t *frequencies, uint16_t *durations, int size) {
  for(int i = 0; i < size; i++) {
    frequencies[i] = (uint16_t) (131 * i * 1.056);
    durations[i] = 200;
  }
  return 0;
}


/*
 * plays the given frequency for the given amount of time
 */
void play_note(uint16_t note_freq, uint16_t duration) {
  unsigned char buffer[BUFFER_SIZE];

  uint32_t sin_table_index = 0;
  uint32_t amp_table_index = 0;
  uint32_t increment = WAVE_TABLE_LENGTH * note_freq / 44100;    
  uint8_t amp_value = 1;
  uint32_t amp_increment = -1;
  
  while(AMP_TABLE_LENGTH != amp_table_index) {
    int i = 0;
    for(i = 0; i < BUFFER_SIZE; i+=2) {
      //printf("%#x\t%d\t",phase_value, phase_value);
      if (++amp_increment % duration == 0) {
        amp_value = amp_table[amp_table_index];
        amp_increment = 0;
        amp_table_index++;
      }
      int16_t phase_value = sin_table[sin_table_index];
      int16_t sample_value = (int16_t)((int32_t)(phase_value * amp_value) >> 8);
      uint8_t header = (uint8_t) ((sample_value >> 8) & 0xFF);
      uint8_t footer = (uint8_t) (sample_value & 0x00FF);
      //printf("%x\t%x\n",header,footer);

      buffer[i] = header;
      buffer[i + 1] = footer;
      sin_table_index = (sin_table_index + increment) % WAVE_TABLE_LENGTH;
 
      if (AMP_TABLE_LENGTH == amp_table_index) {
        break;
      }

    }

    write_to_sound(&playback_handle, buffer, i);
  }
}

