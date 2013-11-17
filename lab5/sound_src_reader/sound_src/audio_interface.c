#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include "audio_interface.h"

void set_up_sound(snd_pcm_t **playback_handle, int encoding_type, 
    uint32_t channels, uint32_t sample_rate) {
  
  int err;
  if ((err = snd_pcm_open (playback_handle, "default", SND_PCM_STREAM_PLAYBACK, 0)) < 0) {
    fprintf (stderr, "cannot open audio device (%s)\n", snd_strerror (err));
    exit (1);
  }

  err = snd_pcm_set_params(*playback_handle, encoding_type, SND_PCM_ACCESS_RW_INTERLEAVED, channels, sample_rate, 1, 500000); 

  if ((err = snd_pcm_prepare (*playback_handle)) < 0) {
    fprintf (stderr, "cannot prepare audio interface for use (%s)\n",
        snd_strerror (err));
    exit (1);
  }
}

void write_to_sound(snd_pcm_t **playback_handle, unsigned char *buffer, uint32_t num_bytes_to_write) {

  long num_frames_to_write = snd_pcm_bytes_to_frames(*playback_handle, num_bytes_to_write);
  size_t num_bytes_written = 0;
  size_t num_frames_written = 0;
  int err;

  while (num_frames_written != num_frames_to_write) {
    err = snd_pcm_writei (*playback_handle, buffer + num_bytes_written, num_frames_to_write - num_frames_written);
    if (err < 0) {
      fprintf (stderr, "write to audio interface failed (%s)\n",
          snd_strerror (err));
      exit (1);
    }
    num_frames_written += err;
    num_bytes_written += snd_pcm_frames_to_bytes(*playback_handle, err);
  }

}

