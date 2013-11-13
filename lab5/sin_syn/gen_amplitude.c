#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>

#include "write_to_file.h"

static void extract_ints (int *ints, char **args, int length);

// Lab 5 part 3
// Joseph Godlewski, Zhiting Zhu
int main(int argc, char **argv) {
    if (argc != 5) {
        fprintf(stderr, "Usage: %s <attack length> <decay length> \
                <sustain length> <release length>\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    int lengths[4];
    extract_ints(lengths, argv, 4);
    FILE *fp = fopen("amplitude_table.h", "w+");
    if(!fp) {
        fprintf(stderr, "error opening file\n");
         exit(EXIT_FAILURE);
    } 
    int i;
    int length = 0;
    for (i = 0; i < 4; i++) {
      length += lengths[i];
    }
    char start_str[150];
    snprintf(start_str, 150, "#ifndef _AMP_TABLE_H_\n#define _AMP_TABLE_H_\n#include <stdint.h>\n#define AMP_TABLE_LENGTH %d\n\nconst uint8_t amp_table[] = {", length);
    int err = write_to_file(start_str, fp);
    if (err == EXIT_FAILURE) {
        return EXIT_FAILURE;
    }
    
    // Attack
    for (i = 0; i < lengths[0]; i++) {
        uint8_t amp = (uint8_t) (i * 255 / lengths[0]);
        char str[5];
        snprintf(str, 5, "%d, ", amp);
        err = write_to_file(str, fp);
        if(err == EXIT_FAILURE) {
            return EXIT_FAILURE;
        }
    }
    
    // Decay
    for (i = 0; i < lengths[1]; i++) {
        uint8_t amp = (uint8_t) (255 - i * 128 / lengths[1]);
        char str[5];
        snprintf(str, 5, "%d, ", amp);
        err = write_to_file(str, fp);
        if(err == EXIT_FAILURE) {
            return EXIT_FAILURE;
        } 
    }
    
    // Sustain
    for (i = 0; i < lengths[2]; i++) {
        uint8_t amp = (uint8_t) (128);
        char str[5];
        snprintf(str, 5, "%d, ", amp);
        err = write_to_file(str, fp);
        if(err == EXIT_FAILURE) {
            return EXIT_FAILURE;
        }
    }
    
    // Release
    for (i = 0; i < lengths[3]; i++) {
        uint8_t amp = (uint8_t) (128 - i * 128 / lengths[3]);
        char str[7];
        snprintf(str, 4, "%d", amp);
        if (i != lengths[3] - 1) {
            strncat(str, ", ", 3);
        } else {
            strncat(str, "};\n", 4);
        }
        
        err = write_to_file(str, fp);
        if(err == EXIT_FAILURE) {
            return EXIT_FAILURE;
        }
    }
    
    char *end_str = "#endif //_AMP_TABLE_H_";
    err = write_to_file(end_str, fp);
    if (err == EXIT_FAILURE) {
        return EXIT_FAILURE;
    }
    
    fclose(fp);
    return EXIT_SUCCESS;
}

void extract_ints (int *ints, char **args, int length) {
    int i;
    for(i = 1; i <= length; i++) {
        ints[i - 1] = atoi(args[i]);
    }
}

