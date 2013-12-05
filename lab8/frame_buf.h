#ifndef FRAME_BUF_H_
#define FRAME_BUF_H_

int init_fb();
void write_grid();
int write_line(int element, int prev, int y);
void cleanup_fb();


#endif // FRAME_BUF_H_
