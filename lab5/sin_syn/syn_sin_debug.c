#include <stdlib.h>
#include <arpa/inet.h>
#include <stdint.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include "sin_table.h"
#include "amplitude_table.h"

#define AUDIO_FILE_ENCODING_LINEAR_16 3
#define BUFFER_SIZE 20000

int main(int argc, char** argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <frequency>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  int frequency = atoi(argv[1]);
  int table_length = WAVE_TABLE_LENGTH;
  int err;
  
  
  unsigned char buffer[BUFFER_SIZE];
  
  int16_t previous_phase = 0;
  uint16_t phase_index = 0;
  uint16_t increment = (table_length*frequency/44100);
  uint32_t amp_index = 0;
  
  while (AMP_TABLE_LENGTH != amp_index) {
    uint16_t len = 0; 
    for (int i = 0; i < BUFFER_SIZE; i++) {
      int16_t phase_value = sin_table[phase_index];
      uint8_t amp_value = amp_table[amp_index];
      int16_t sample_value = (int16_t)((int32_t)(phase_value * amp_value) >> 8);
      
      
      buffer[i] = sample_value;
      printf("%d\t%d\n", amp_index, sample_value);
      previous_phase = phase_index;
      phase_index = (previous_phase + increment) % table_length;
      len ++;
      if (AMP_TABLE_LENGTH == ++amp_index) {
        break;
      }
    } 
  }
  exit(EXIT_SUCCESS);
}
