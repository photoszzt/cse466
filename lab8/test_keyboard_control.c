#include <signal.h>
#include <sys/types.h>  
#include <sys/stat.h>  
#include <fcntl.h>  
#include <stdio.h>  
#include <poll.h>    
#include <sys/types.h>  
#include <unistd.h>  
#include <fcntl.h>
#include <string.h>

volatile int in;

void handle_input(int);

void handle_input(int signum) {
  char buf[10];
  memset(buf, 0x0, 10);
  size_t n = read(in, buf, 10); 
  if (n > 0) {
    printf("%s/n", buf);
  }
}

int main() {
  struct sigaction saio;
  memset(&saio, 0x0, sizeof(struct sigaction));
  saio.sa_handler = handle_input;
  sigaction(SIGIO, &saio, NULL);
  in = fcntl(STDIN_FILENO, F_GETFL);
  if (in < 0) {
    printf("flag retrival error");
  }
  in = fcntl(in, F_SETFL, O_ASYNC);
  in = fcntl(in, F_SETOWN, getpid());
  while(1) {
    usleep(1000);
  }
  close(in);
  return 0;
}
