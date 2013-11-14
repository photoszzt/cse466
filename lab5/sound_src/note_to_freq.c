#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "note_table.h"

int main() {
  
}

/*
 * return 0 if reaches the end of the file
 */
int get_frequencies_and_durations (FILE* fp, uint16_t* frequencies, uint16_t* durations, int size) {
  char* line = NULL;
  size_t len = 0;
  ssize_t read;
  int count = 0;
  int finish = 0;
  while ((read = getline(&line, &len, fp)) != -1 && count < size) {
    int numcommand = 0;
    line[len - 1] = '\0';
    char** notes_durations = Split(" ", line, &numcommand);
    if (numcommand != 2) {
      fprintf(stderr, "Input error");
      exit(EXIT_FAILURE);
    }
    char* note = notes_durations[0];
    durations[count] = atoi(notes_durations[1]);
    char purenote[3];
    memset(purenote, 0x0, 3);
    int length = strlen(note);
    strncpy(purenote, note, length - 1);
    printf("%s\t%s\n", note, purenote);
    uint8_t scale = atoi(note[length - 1]) - 3;
    printf("%d\n", scale);
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
      fprintf(stderr, "Unrecognized note found");
      exit(EXIT_FAILURE);
    }
    frequencies[count] = base + scale*11;
    coount++;
  }
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
  char** progs = (char**) malloc((numprog+1)*sizeof(char*));
  int start = 0;
  int progcount = 0;
  for (i = 0; i < length; i++) {
    if (spliting[i] == spliter) {
      char temp[i-start];
      temp[0]=0x0;
      memset(temp, 0x0, i-start);
      char *to = (char*) malloc((i-start)*sizeof(char));
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
  char *to = (char*) malloc((length-start)*sizeof(char));
  strncpy(temp, spliting+start, length-start);
  int begin, end;
  Trim(temp, 0, length-start-1, &begin, &end);
  strncpy(to, temp+begin, end-begin+1);
  progs[progcount] = to;
  //progs[numprog] = (char *)0;
  *size = numprog;
  return progs;
}
 
