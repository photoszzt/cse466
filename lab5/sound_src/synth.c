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

int main(int argc, char **argv) {
 
  if(argc != 2) {
    fprintf(stderr, "Usage: %s <frequency>\n", argv[0]);
    exit(EXIT_FAILURE);
  }
 
  int frequency = atoi(argv[1]);
  snd_pcm_t *playback_handle;

  set_up_sound(&playback_handle, SND_PCM_FORMAT_S16_BE, 1, 44100);
  
  unsigned char buffer[BUFFER_SIZE];
  
  uint32_t sin_table_index = 0;
  uint32_t amp_table_index = 0;
  uint32_t increment = WAVE_TABLE_LENGTH * frequency / 44100;    
  int set_amp = 1;
  uint8_t amp_value = 1;
  uint32_t amp_increment = 0;
  while(AMP_TABLE_LENGTH != amp_table_index) {
    int i = 0;
    for(i = 0; i < BUFFER_SIZE; i+=2) {
      //printf("%#x\t%d\t",phase_value, phase_value);
      if (set_amp) {
	amp_value = amp_table[amp_table_index];
	set_amp = 0;
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
      if (++amp_increment % 100 == 0){
	set_amp = 1;
	amp_increment = 0;
      }
      if (AMP_TABLE_LENGTH == amp_table_index) {
	break;
      }

    }
   
    write_to_sound(&playback_handle, buffer, i);
  }
}

