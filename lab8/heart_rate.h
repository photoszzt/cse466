#ifndef HEART_RATE_H_
#define HEART_RATE_H_

#define BASE_THRESH 450
#define CONST_INTERVAL 10
#define DECAY_INTERVAL 10

#define T_DEFAULT
#define T_DECAYING
#define T_ELEVATED

struct heart_rate {
  int cur_thresh;
  int thresh_state;
  int prior_peak_time;
  int heart_rate_value;
  int prev_val;
};

void update_heart_rate(struct heart_rate *hr, int value, int time);

#endif // HEART_RATE_H_
