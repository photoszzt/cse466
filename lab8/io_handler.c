#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>

#include "io_handler.h"

int state = 0;

void setup() {
  int flag = 0;

  // Make STDIN asynchronous
  flag = fcntl(STDIN_FILENO, F_GETFL);
  if (flag < 0) {
    printf("flag retrieval error\n");
    exit(1);
  }
  flag = fcntl(STDIN_FILENO, F_SETFL, flag | O_ASYNC);
  if (flag < 0) {
    printf("set error\n");
    exit(1);
  }
  flag = fcntl(STDIN_FILENO, F_SETOWN, getpid());
  if (flag < 0) {
    printf("owner error\n");
    exit(1);
  }
  // Map the IO interrupt from STDIN to our ginal handler
  struct sigaction saio;
  memset(&saio, 0x0, sizeof(struct sigaction));
  saio.sa_handler = io_sig;
  sigaction(SIGIO, &saio, NULL);
}

// The I/O handler
void io_sig(int signo) {
  char c[4];
  int i = read(STDIN_FILENO, c, 1);
  if (i < 0) {
     return;
  } 
  if(c[0] == '\n') {
    if(state == 0) {
      //write(STDOUT_FILENO, "Starting", 8);
      state = 1;
    } else {
      //write(STDOUT_FILENO, "Pause", 5);
      state = 0;
    }
  }
}

// Whether the program should continue.
int proceed() {
  return state;
}
