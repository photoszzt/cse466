// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 8 part 4

#include <string.h>

#include "heart_rate.h"

void initialize_hr(struct heart_rate *hr) {
  memset(hr, 0x0, sizeof(struct heart_rate));
  hr->cur_thresh = BASE_THRESH;
  hr->thresh_state = T_DEFAULT;
  hr->heart_rate_value = -1;
}

void update_heart_rate(struct heart_rate *hr, int value, int time) {
  if (hr->thresh_state == T_DEFAULT) {
    if (value > hr->cur_thresh) {
      hr->cur_thresh = value;
    } else if(hr->cur_thresh == hr->prev_val) {
      // we know value <= cur_thresh and that the last value set the peak
      // thus, the previous value is the peak
      hr->thresh_state = T_ELEVATED;
      hr->max_thresh = hr->cur_thresh;
      if (hr->prior_peak_time > 0) {
        // this is not the first peak, thus, we can calculate heart rate
        int period = (time - hr->prior_peak_time) * TIME_RATIO; // period in ms
        double freq = (1.0 / ((double) period / 1000)) * 60;    // freq in bpm
        hr->heart_rate_value = (int) freq;
      }
      hr->prior_peak_time = time - 1;
    }
  } else if(hr->thresh_state == T_ELEVATED) {
    int time_elapse = time - hr->prior_peak_time;
    if (time_elapse > CONST_INTERVAL) {
      hr->thresh_state = T_DECAYING;
    }
  } else { // DECAYING
    int x = time - hr->prior_peak_time - CONST_INTERVAL;
    hr->cur_thresh = hr->max_thresh + x * (BASE_THRESH - hr->max_thresh)/DECAY_INTERVAL;
    if (hr->cur_thresh <= BASE_THRESH) {
      hr->cur_thresh = BASE_THRESH;
      hr->thresh_state = T_DEFAULT;
    } 
  }
  hr->prev_val = value;
}

int get_heart_rate(struct heart_rate *hr) {
  return hr->heart_rate_value;
}
