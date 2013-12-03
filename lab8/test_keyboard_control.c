#include <sys/types.h>  
#include <sys/stat.h>  
#include <fcntl.h>  
#include <stdio.h>  
#include <poll.h>  
#include <signal.h>  
#include <sys/types.h>  
#include <unistd.h>  
#include <fcntl.h>

int in;

int handle_input(int);

int handle_input(int signum) {
  char buf[10];
  memset(buf, 0x0, 10);
  size_t n = read(in, buf, 10); 
  if (n > 0) {
    printf("%s/n", buf);
  }
}

int main() {
  in = fcntl(STDIN_FILENO, F_SETFL, O_ASYNC);
  in = fcntl(in, F_SETOWN, getpid());
  signal(SIGIO, handle_input);
  close(in);
  return 0;
}
