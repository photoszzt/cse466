#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>
#include <string.h>

static int write_to_file (char* str, FILE* fp);

#define M_PI 3.14159265358979323846

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
  char * start_str = "#<include stdint.h>\n\nconst int16_t* sin_table = {";
  int err = write_to_file(start_str, fp);
  if (err == EXIT_FAILURE) 
    return EXIT_FAILURE;
  int i = 0;
  for (i = 0; i < table_length; i++) {
    int16_t temp = (int16_t) (sin((double)i * 2 * M_PI / table_length) * 32767);
    char str[9];
    snprintf(str, 7, "%d", temp);
    if (i != table_length - 1)
      strncat(str, ", ", 3);
    else
      strncat(str, "}", 2);
    err = write_to_file(str, fp);
    if (err == EXIT_FAILURE)
      return EXIT_FAILURE;
  }
  fclose(fp);
  return EXIT_SUCCESS;
}

static int write_to_file (char* str, FILE* fp) {
  int length = strlen(str);
  size_t written = 0;
  while (written != length) {
	size_t res = fwrite(str + written, sizeof(char), length - written, fp);  
	if (ferror(fp)) {
		perror("Error in writing the file");
		return EXIT_FAILURE;	
	}
	written += res;
  }
  return EXIT_SUCCESS;
}