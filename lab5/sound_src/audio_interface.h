#ifndef _AUDIO_INTERFACE_H_
#define _AUDIO_INTERFACE_H_

#include <alsa/asoundlib.h>
#include <stdint.h>

/*
 * Uses the playback_handle to setup an interface to the sound card.
 * When the method is finished, the sound card will be ready to receive
 * samples. If set up fails, the program will exit.
 */
void set_up_sound(snd_pcm_t **playback_handle, int encoding_type, uint32_t channels, uint32_t sample_rate);

/*
 * Writes the contents of buffer to the sound card, blocking if needed.
 * Failure will cause the program to exit.
 */
void write_to_sound(snd_pcm_t **playback_handle, unsigned char *buffer, uint32_t num_bytes_to_write);


#endif //_AUDIO_INTERFACE_H_
