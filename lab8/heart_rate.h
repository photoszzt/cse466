// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 8 part 4

#ifndef HEART_RATE_H_
#define HEART_RATE_H_

#define BASE_THRESH 450
#define CONST_INTERVAL 20
#define DECAY_INTERVAL 20

#define TIME_RATIO 10

#define T_DEFAULT 0
#define T_DECAYING 1
#define T_ELEVATED 2

struct heart_rate {
  int cur_thresh;
  int max_thresh;
  int thresh_state;
  int prior_peak_time;
  int heart_rate_value;
  int prev_val;
};

void initialize_hr(struct heart_rate *hr);
void update_heart_rate(struct heart_rate *hr, int value, int time);
int get_heart_rate(struct heart_rate *hr);

#endif // HEART_RATE_H_
