// Lab 5 part 3
// Joseph Godlewski, Zhiting Zhu

#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

int write_to_file (char* str, FILE* fp) {
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
