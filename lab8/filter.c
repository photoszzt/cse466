#include "filter.h"

static int filter_taps[FILTER_TAP_NUM] = {
  -501,
  -458,
  -618,
  -772,
  -899,
  -982,
  -1004,
  -955,
  -830,
  -636,
  -388,
  -107,
  178,
  434,
  632,
  747,
  764,
  681,
  508,
  268,
  -4,
  -269,
  -486,
  -618,
  -640,
  -542,
  -330,
  -31,
  316,
  659,
  942,
  1115,
  1138,
  991,
  678,
  229,
  -304,
  -845,
  -1311,
  -1615,
  -1680,
  -1450,
  -896,
  -26,
  1119,
  2461,
  3896,
  5305,
  6564,
  7558,
  8194,
  8414,
  8194,
  7558,
  6564,
  5305,
  3896,
  2461,
  1119,
  -26,
  -896,
  -1450,
  -1680,
  -1615,
  -1311,
  -845,
  -304,
  229,
  678,
  991,
  1138,
  1115,
  942,
  659,
  316,
  -31,
  -330,
  -542,
  -640,
  -618,
  -486,
  -269,
  -4,
  268,
  508,
  681,
  764,
  747,
  632,
  434,
  178,
  -107,
  -388,
  -636,
  -830,
  -955,
  -1004,
  -982,
  -899,
  -772,
  -618,
  -458,
  -501
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
