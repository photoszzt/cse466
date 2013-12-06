// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 8 part 2

#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <termios.h>

#include "io_handler.h"

int state = PAUSED;
struct termios old_term, new_term;

// The I/O handler
void io_sig(int signo) {
  char c[4];
  int i = read(STDIN_FILENO, c, 1);
  if (i < 0) {
     return;
  } 
  if(c[0] == '\n') {
    if(state == PAUSED) {
      //write(STDOUT_FILENO, "Starting", 8);
      state = RUNNING;
    } else if(state == RUNNING) {
      //write(STDOUT_FILENO, "Pause", 5);
      state = PAUSED;
    }
  }
}

// The stop handler
void stop_handler(int signo) {
  state = STOPPED;
}


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
  // Map the IO interrupt from STDIN to the I/O signal handler
  struct sigaction saio;
  memset(&saio, 0x0, sizeof(struct sigaction));
  saio.sa_handler = io_sig;
  sigaction(SIGIO, &saio, NULL);
  disable_terminal();

  // Map the C-c interrupt to the stop signal handler
  struct sigaction sas;
  memset(&sas, 0x0, sizeof(struct sigaction));
  sas.sa_handler = stop_handler;
  sigaction(SIGINT, &sas, NULL);

}

int get_state() {
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
