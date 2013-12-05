#ifndef _IO_HANDLER_H_
#define _IO_HANDLER_H_

#define STOPPED 0
#define PAUSED  1
#define RUNNING 2

void setup();
void io_sig(int signo);
int get_state();
void disable_terminal(); 
void enable_terminal(); 

#endif // _IO_HANDLER_H_
