// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 5 part 2

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <alsa/asoundlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include "audio_interface.h"

#define AUDIO_FILE_MAGIC (uint32_t)0x02E736E64

#define AUDIO_FILE_ENCODING_MULAW 1
#define AUDIO_FILE_ENCODING_LINEAR_8 2
#define AUDIO_FILE_ENCODING_LINEAR_16 3

#define STEREO 2
#define MONO 1

typedef struct {
  uint32_t magic;
  uint32_t hdr_size;
  uint32_t data_size;
  uint32_t encoding;
  uint32_t sample_rate;
  uint32_t channels;
} au_header;

int main(int argc, char **argv) {
	
  // Check arguments
  if(argc != 2) {
    fprintf(stderr, "Usage: %s <filename.au>\n", argv[0]);
    exit(1);
  }
	
  int fd = 0;
  char * filename = argv[1];
  fd = open(filename, O_RDONLY);
  uint32_t buf[6];
  size_t desired_size = 6*sizeof(uint32_t);
  size_t res = 0;
  
  int i;
  snd_pcm_t *playback_handle;
  int encoding_type;
  while (res != desired_size) {
    size_t temp = read(fd, buf + res, desired_size - res);
    if (temp <= 0 && errno != EAGAIN) exit(EXIT_FAILURE);
    res += temp;
  }
  au_header header;
  memset(&header, 0, sizeof(au_header));
  header.magic = ntohl(buf[0]);
  header.hdr_size = ntohl(buf[1]);
  header.data_size = ntohl(buf[2]);
  header.encoding = ntohl(buf[3]);
  header.sample_rate = ntohl(buf[4]);
  header.channels = ntohl(buf[5]);
  if (header.magic != AUDIO_FILE_MAGIC) {
    fprintf(stderr, "Magic number is not consistent\n");
    exit(EXIT_FAILURE);
  }
  switch (header.encoding) {
  case AUDIO_FILE_ENCODING_MULAW:
    encoding_type = SND_PCM_FORMAT_MU_LAW;
    printf("The file encoding is 8-bit ISDN u-law\n");
    break;
  case AUDIO_FILE_ENCODING_LINEAR_8:
    encoding_type = SND_PCM_FORMAT_S8;
    printf("The file encoding is 8-bit linear PCM\n");
    break;
  case AUDIO_FILE_ENCODING_LINEAR_16:
    encoding_type = SND_PCM_FORMAT_S16_BE;
    printf("The file encoding is 16-bit linear PCM\n");
    break;
  default:
    printf("The file encoding is not recognized\n");
  }
  printf("The sample rate of the file is %d samples per second\n", header.sample_rate);
  printf("The number of channel(s) is %d\n", header.channels); 

  set_up_sound(&playback_handle, encoding_type, header.channels, header.sample_rate);	

  int buf_size = lseek(fd, 0L, SEEK_END) - sizeof(au_header);
  printf("buffer size is: %d\n", buf_size);
  lseek(fd, sizeof(au_header), SEEK_SET);
  unsigned char data[buf_size];
  size_t num_bytes_read = 0;
  while (num_bytes_read != buf_size) {
    size_t temp = read(fd, data + num_bytes_read, buf_size - num_bytes_read);
    if (temp < 0 && errno != EAGAIN) exit(EXIT_FAILURE);
    num_bytes_read += temp;
  }

  size_t num_bytes_to_write = num_bytes_read / 4;

  for (i = 0; i < 4; i++) {
    write_to_sound(&playback_handle, data + i * num_bytes_to_write, num_bytes_to_write);
  }  

 snd_pcm_close (playback_handle);
  exit (EXIT_SUCCESS);
}
