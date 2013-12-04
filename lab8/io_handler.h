#ifndef _IO_HANDLER_H_
#define _IO_HANDLER_H_

void setup();
void io_sig(int signo);
int proceed();
void disable_terminal(); 
void enable_terminal(); 

#endif // _IO_HANDLER_H_
