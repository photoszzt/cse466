#include "filter.h"

static int filter_taps[FILTER_TAP_NUM] = {
  480,
  368,
  231,
  -198,
  -922,
  -1824,
  -2661,
  -3105,
  -2832,
  -1620,
  551,
  3457,
  6648,
  9541,
  11561,
  12286,
  11561,
  9541,
  6648,
  3457,
  551,
  -1620,
  -2832,
  -3105,
  -2661,
  -1824,
  -922,
  -198,
  231,
  368,
  480
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
