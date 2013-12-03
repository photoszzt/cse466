#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>

void io_sig(int);
int q = 0;
int state = 0;

int main(int argc, char **argv) {
  int flag = 0;
  int value = O_ASYNC;
  flag = fcntl(STDIN_FILENO, F_GETFL);
  if (flag < 0) {
    printf("flag retrieval error\n");
    exit(1);
  }
  flag = fcntl(STDIN_FILENO, F_SETFL, flag | value);
  if (flag < 0) {
    printf("set error\n");
    exit(1);
  }
  flag = fcntl(STDIN_FILENO, F_SETOWN, getpid());
  if (flag < 0) {
    printf("owner error\n");
    exit(1);
  }
  
  printf("STDIN set!!\n");
  struct sigaction saio;
  memset(&saio, 0x0, sizeof(struct sigaction));
  saio.sa_handler = io_sig;
  sigaction(SIGIO, &saio, NULL);

  while(1) {
    sleep(10);
  }
  return 0;
}

void io_sig(int signo) {
  char c[4];
  int i = read(STDIN_FILENO, c, 1);
  if (i < 0) {
     exit(1);
  }
  if(c[0] == 'q') {
    exit(0);
  } else if(c[0] == '\n') {
    if(state == 0) {
      write(STDOUT_FILENO, "Starting", 8);
      state = 1;
    } else {
      write(STDOUT_FILENO, "Pause", 5);
      state = 0;
    }
  } else {
    /*write(STDOUT_FILENO, "Read character: ", 16);
    write(STDOUT_FILENO, c, 1);
    write(STDOUT_FILENO, "\n", 1);*/
  }
}
