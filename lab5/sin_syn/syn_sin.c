#include <stdlib.h>
#include <alsa/asoundlib.h>
#include <arpa/inet.h>
#include <stdint.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include "sin_table.h"

#define AUDIO_FILE_ENCODING_LINEAR_16 3
#define BUFFER_SIZE 20000

int main(int argc, char** argv) {
  if (argc != 3) {
    fprintf(stderr, "Usage: %s <frequency> <table_length>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  int frequency = atoi(argv[1]);
  int table_length = atoi(argv[2]);
  snd_pcm_t *play_handle;
  int err;
  if ((err = snd_pcm_open (&play_handle, "default", SND_PCM_STREAM_PLAYBACK, 0)) < 0) {
    fprintf (stderr, "cannot open audio device %s (%s)\n", 
	     argv[1],
	     snd_strerror (err));
    exit (1);
  }
  err = snd_pcm_set_params(play_handle, SND_PCM_FORMAT_S16_LE, SND_PCM_ACCESS_RW_INTERLEAVED, 1, 44100, 1, 500000); 
  if ((err = snd_pcm_prepare (play_handle)) < 0) {
    fprintf (stderr, "cannot prepare audio interface for use (%s)\n",
	     snd_strerror (err));
    exit (1);
  }
  
  unsigned char buffer[BUFFER_SIZE];
  
  int16_t previous_phase = 0;
  int16_t phase_index = 0;
  int16_t increment = (table_length*frequency/44100);
  
  uint32_t time = 100;
  while (time > 0) {
    for (int i = 0; i < BUFFER_SIZE; i++) {
      buffer[i] = sin_table[phase_index];
      previous_phase = phase_index;
      phase_index = (previous_phase + increment) % table_length;
    }
    long num_frames_to_write = snd_pcm_bytes_to_frames(play_handle, BUFFER_SIZE);
    size_t num_frames_written = 0;
    size_t num_bytes_written = 0;
    while (num_frames_written != num_frames_to_write) {
      err = snd_pcm_writei(play_handle, buffer + num_bytes_written, num_frames_to_write - num_frames_written);
      if (err < 0) {
	fprintf(stderr, "write to audio interface failed (%s)\n", snd_strerror(err));
	exit(1);
      }
      num_frames_written += err;
      num_bytes_written += snd_pcm_frames_to_bytes(play_handle, err);
    }
    time--;
  }
  snd_pcm_close(play_handle);
  exit(EXIT_SUCCESS);
}
