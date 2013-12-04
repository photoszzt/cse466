#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <termios.h>

#include "io_handler.h"

int state = 0;
struct termios old_term, new_term;

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
  // Map the IO interrupt from STDIN to our signal handler
  struct sigaction saio;
  memset(&saio, 0x0, sizeof(struct sigaction));
  saio.sa_handler = io_sig;
  sigaction(SIGIO, &saio, NULL);
  disable_terminal();
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

void disable_terminal() {
  // Disable keys being echoed to the screen
  tcgetattr(STDIN_FILENO, &old_term);
  new_term = old_term;
  new_term.c_lflag &= ~(ICANON | ECHO); 
  tcsetattr(STDIN_FILENO, TCSANOW, &new_term);
}

void enable_terminal() {
  tcsetattr(STDIN_FILENO, TCSANOW, &old_term);
}
