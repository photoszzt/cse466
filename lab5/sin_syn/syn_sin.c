#include "sin_table.h"
#include <stdlib.h>
#include <alsa/asoundlib.h>
#include <arpa/inet.h>

#define AUDIO_FILE_ENCODING_LINEAR_16 3

int main(int argc, char** argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <frequency>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  int frequency = atoi(argv[1]);
  snd_pcm_t *play_handle;
  int err;
  err = snd_pcm_set_params(playback_handle, AUDIO_FILE_ENCODING_LINEAR_16, SND_PCM_ACCESS_RW_INTERLEAVED, 1, 44100, 1, 500000); 
  if ((err = snd_pcm_prepare (playback_handle)) < 0) {
    fprintf (stderr, "cannot prepare audio interface for use (%s)\n",
	     snd_strerror (err));
    exit (1);
  }
  
}
