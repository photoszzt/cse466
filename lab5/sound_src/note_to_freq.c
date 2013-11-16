#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "note_table.h"

static void Trim(char* temp, int begin, int end, int* newbegin, int* newend);
static char ** Split(char spliter, char * spliting, int * size);

// Testing program
/*int main() {
  FILE* fp = fopen("notes.txt", "r");
  uint16_t frequencies[10];
  uint16_t durations[10];
  int continuing = 1;
  int i = 0;
  memset(frequencies, 0, 10*sizeof(uint16_t));
  memset(durations, 0, 10*sizeof(uint16_t));
  while(continuing) {
    continuing = get_frequencies_and_durations(fp, frequencies, durations, 10);
    
    for (i = 0; i < 10; i++) {
      printf("%d ", frequencies[i]);
    }
    printf("\n");
  }
  
  fclose(fp);
  return 0;
  }*/

/*
 * Read the song file and transform return the duration of each note and the index to the note table.
 * return -amount of items read if reaches the end of the file
 * otherwise return the amount of items read
 */
int get_frequencies_and_durations (FILE* fp, uint16_t* frequencies, uint16_t* durations, int size) {
  char* line = NULL;
  size_t len = 0;
  size_t read;
  int count = 0;
  while (count < size && (read = getline(&line, &len, fp)) != -1) {
    int numnotes = 0;
    int line_length = strlen(line);
    if (line[line_length - 1] == '\n')
      line[line_length - 1] = '\0';
    char** notes_durations = Split(' ', line, &numnotes);
    if (numnotes != 2) {
      fprintf(stderr, "Input error");
      exit(EXIT_FAILURE);
    }
    char* note = notes_durations[0];
    durations[count] = atoi(notes_durations[1]);
    char purenote[3];
    memset(purenote, 0x0, 3);
    int length = strlen(note);
    strncpy(purenote, note, length - 1);
    uint8_t scale = atoi(note + length - 1) - 3;
    int base = 0;
    if (strcmp(purenote, "C") == 0)
      base = 0;
    else if (strcmp(purenote, "C#") == 0)
      base = 1;
    else if (strcmp(purenote, "Db") == 0)
      base = 1;
    else if (strcmp(purenote, "D") == 0)
      base = 2;
    else if (strcmp(purenote, "D#") == 0)
      base = 3;
    else if (strcmp(purenote, "Eb") == 0)
      base = 3;
    else if (strcmp(purenote, "E") == 0)
      base = 4;
    else if (strcmp(purenote, "F") == 0)
      base = 5;
    else if (strcmp(purenote, "F#") == 0)
      base = 6;
    else if (strcmp(purenote, "Gb") == 0)
      base = 6;
    else if (strcmp(purenote, "G") == 0)
      base = 7;
    else if (strcmp(purenote, "G#") == 0)
      base = 8;
    else if (strcmp(purenote, "Ab") == 0)
      base = 8;
    else if (strcmp(purenote, "A") == 0)
      base = 9;
    else if (strcmp(purenote, "A#") == 0)
      base = 10;
    else if (strcmp(purenote, "Bb") == 0)
      base = 10;
    else if (strcmp(purenote, "B") == 0)
      base = 11;
    else {
      fprintf(stderr, "Unrecognized note found\n");
      exit(EXIT_FAILURE);
    }
    frequencies[count] = base + scale*12;
    for (int i = 0; i < numnotes; i++) {
      free(notes_durations[i]);
    }
    free(notes_durations);
    free(line);
    line = NULL;
    count++;
  }
  if (line)
    free(line);
  if (read == -1)
    return -count;
  else return count;
}

static void Trim(char* temp, int begin, int end, int* newbegin, int* newend) {
  while(temp[begin] == ' ' || temp[begin] == '\t') 
    begin++;
  while(temp[end] == ' '|| temp[end] == '\t') 
    end--;
  *newbegin = begin;
  *newend = end;
}

static char ** Split(char spliter, char * spliting, int * size) {
  int i;
  int length = strlen(spliting);
  int numprog = 1;
  for (i = 0; i < length; i++ ) {
    if (spliting[i] == spliter) {
      numprog++;
    }
  }
  char** progs = (char**) calloc((numprog+1), sizeof(char*));
  int start = 0;
  int progcount = 0;
  for (i = 0; i < length; i++) {
    if (spliting[i] == spliter) {
      char temp[i-start];
      temp[0]=0x0;
      memset(temp, 0x0, i-start);
      char *to = (char*) calloc((i-start), sizeof(char));
      strncpy(temp, spliting+start, i-start);
      int begin, end;
      Trim(temp, 0, i-start-1, &begin, &end);
      strncpy(to, temp+begin, end-begin+1);
      start = i + 1;
      progs[progcount] = to;
      progcount++;
    }
  }
  char temp[length-start];
  char *to = (char*) calloc((length-start), sizeof(char));
  strncpy(temp, spliting+start, length-start);
  int begin, end;
  Trim(temp, 0, length-start-1, &begin, &end);
  strncpy(to, temp+begin, end-begin+1);
  progs[progcount] = to;
  //progs[numprog] = (char *)0;
  *size = numprog;
  return progs;
}
 
