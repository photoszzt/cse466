#include "filter.h"

static int filter_taps[FILTER_TAP_NUM] = {
  -49,
  -718,
  -907,
  -1306,
  -1611,
  -1744,
  -1632,
  -1250,
  -635,
  107,
  818,
  1323,
  1472,
  1184,
  485,
  -486,
  -1489,
  -2230,
  -2422,
  -1857,
  -466,
  1655,
  4245,
  6920,
  9246,
  10828,
  11389,
  10828,
  9246,
  6920,
  4245,
  1655,
  -466,
  -1857,
  -2422,
  -2230,
  -1489,
  -486,
  485,
  1184,
  1472,
  1323,
  818,
  107,
  -635,
  -1250,
  -1632,
  -1744,
  -1611,
  -1306,
  -907,
  -718,
  -49
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
