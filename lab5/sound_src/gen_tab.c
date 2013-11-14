#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>

#include "write_to_file.h"

#define M_PI 3.14159265358979323846

// Lab 5 part 3
// Joseph Godlewski, Zhiting Zhu
int main(int argc, char** argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <table length>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  int table_length = atoi(argv[1]);
  FILE* fp = fopen("sin_table.h", "w+");
  if (!fp) {
	fprintf(stderr, "error in open file\n");
	exit(EXIT_FAILURE);
  } 
  char start_str[150]; 
  snprintf(start_str, 150, "#ifndef _SIN_TABLE_H_\n#define _SIN_TABLE_H_\n#include <stdint.h>\n#define WAVE_TABLE_LENGTH %d\n\nconst int16_t sin_table[] = {", table_length);
  int err = write_to_file(start_str, fp);
  if (err == EXIT_FAILURE) 
    return EXIT_FAILURE;
  int i = 0;
  for (i = 0; i < table_length; i++) {
    int16_t temp = (int16_t) (sin(((double)i * 2.0 * M_PI) / ((double)table_length)) * 32767);
    char str[30];
    snprintf(str, 7, "%d", temp);
    if (i != table_length - 1)
      strncat(str, ", ", 3);
    else
      strncat(str, "};\n#endif // _SIN_TABLE_H_", 30);
    err = write_to_file(str, fp);
    if (err == EXIT_FAILURE)
      return EXIT_FAILURE;
  }
  fclose(fp);
  return EXIT_SUCCESS;
}
