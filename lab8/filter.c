#include "filter.h"

static int filter_taps[FILTER_TAP_NUM] = {
  378,
  103,
  81,
  27,
  -63,
  -189,
  -351,
  -544,
  -757,
  -977,
  -1189,
  -1371,
  -1504,
  -1566,
  -1538,
  -1404,
  -1153,
  -780,
  -287,
  315,
  1008,
  1768,
  2562,
  3357,
  4113,
  4794,
  5365,
  5796,
  6064,
  6155,
  6064,
  5796,
  5365,
  4794,
  4113,
  3357,
  2562,
  1768,
  1008,
  315,
  -287,
  -780,
  -1153,
  -1404,
  -1538,
  -1566,
  -1504,
  -1371,
  -1189,
  -977,
  -757,
  -544,
  -351,
  -189,
  -63,
  27,
  81,
  103,
  378
};

void filter_init(filter_t* f) {
  int i;
  for(i = 0; i < FILTER_TAP_NUM; ++i)
    f->history[i] = 0;
  f->last_index = 0;
}

void filter_put(filter_t* f, int input) {
  f->history[f->last_index++] = input;
  if(f->last_index == FILTER_TAP_NUM)
    f->last_index = 0;
}

int filter_get(filter_t* f) {
  long long acc = 0;
  int index = f->last_index, i;
  for(i = 0; i < FILTER_TAP_NUM; ++i) {
    index = index != 0 ? index-1 : FILTER_TAP_NUM-1;
    acc += (long long)f->history[index] * filter_taps[i];
  };
  return acc >> 16;
}
