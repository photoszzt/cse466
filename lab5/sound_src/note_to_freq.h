#ifndef _NOTE_TO_FREQ_H_
#define _NOTE_TO_FREQ_H_

#include <stdio.h>
#include <stdint.h>

int get_frequencies_and_durations(FILE* fp, uint16_t* frequencies, uint16_t* durations, int size);

#endif // _NOTE_TO_FREQ_H_
