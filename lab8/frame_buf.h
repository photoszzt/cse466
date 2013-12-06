// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 8 part 2 - 4

#ifndef FRAME_BUF_H_
#define FRAME_BUF_H_

int init_fb();
void write_grid();
int write_line(int element, int prev, int y);
void clear_hr();
void write_heart_rate(int hr);
void cleanup_fb();


#endif // FRAME_BUF_H_
