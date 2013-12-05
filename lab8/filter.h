#ifndef FILTER_H_
#define FILTER_H_

/*

FIR filter designed with
 http://t-filter.appspot.com

sampling frequency: 250 Hz

fixed point precision: 16 bits

* 0 Hz - 20 Hz
  gain = 1
  desired ripple = 5 dB
  actual ripple = n/a

  * 30 Hz - 125 Hz
  gain = 0
  desired attenuation = -40 dB
  actual attenuation = n/a

*/

#define FILTER_TAP_NUM 103

typedef struct {
  int history[FILTER_TAP_NUM];
  unsigned int last_index;
} filter_t;

void filter_init(filter_t* f);
void filter_put(filter_t* f, int input);
int filter_get(filter_t* f);

#endif
