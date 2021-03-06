// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 8 part 1 - 4

#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/ioctl.h>

#include "io_handler.h"
#include "filter.h"
#include "frame_buf.h"
#include "heart_rate.h"

// Note FB is 240x320px at 16bpp

void stabilize(); 
void monitor_heart_rate(int);
int get_value(int);

int main(int argc, char** argv) {

  // remap stdin
  setup();

  // open the adc
  int fd = open("/dev/adc", 0);
  if (fd < 0) {
    perror("failed to open ADC device:");
    return 1;
  }
  // initialize the frame buffer
  init_fb();
  write_grid();
  while(get_state() != STOPPED) {
    // wait for the user to start
    while(get_state() == PAUSED) {
      usleep(4000);
    }
    // stabilize
    write_grid();
    stabilize();

    // signal stabilized, can execute
    monitor_heart_rate(fd);

  }
  // cleanup
  enable_terminal();
  close(fd);
  cleanup_fb();
  return 0;
}

void stabilize() {
  sleep(5);
}

void monitor_heart_rate(int fd) {
  filter_t f;
  memset(&f, 0x0, sizeof(filter_t));
  filter_init(&f);
  struct heart_rate hr;
  initialize_hr(&hr);
  int prev = 0;
  int i = 0;
  int j = 0;
  int values[7500];
  while(j < 7500 && get_state() == RUNNING) {
    // Get the adc value
    int value = get_value(fd);
    filter_put(&f, value);
    value = filter_get(&f);
    values[j] = value;
    // write out samples every 0.008 sec (every 2 cycles)
    if(j % 2 == 1) {
      value = (value + values[j - 1]) / 2;
      i = write_line(value, prev, i);
      prev = value;
      update_heart_rate(&hr, value, j);
      int heart_rate = get_heart_rate(&hr);
      clear_hr();
      write_heart_rate(heart_rate);
    }
    j++;
    usleep(4000);
  }

}

/*
 * Retrieves a value from the ADC and returns it to the caller.
 */
int get_value(int fd) {
  char buffer[30];
  int len = read(fd, buffer, sizeof buffer -1);
  int value = -1;
  if (len > 0) {
    buffer[len] = '\0';
    sscanf(buffer, "%d", &value);
    // printf("ADC Value: %d\n", value);
  } else {
    perror("read ADC device:");
    return 1;
  }
  return value;
}

