// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 6 final part
// Program to be run on the Friendly Arm board
// It send via i2c a byte that changes the blinking frequency
// of a LED connected to a MSP430f2013.

#include <stdio.h>
#include <fcntl.h>
#include <getopt.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "i2c-dev.h"

#define S_ADDR 0x48

/*
 * Opens the i2c file in /dev, returning the file descriptor to the caller.
 */
int open_i2c_dev(const int i2cbus, char *filename, const int quiet)
{
  int file;
  sprintf(filename, "/dev/i2c/%d", i2cbus);

  file = open(filename, O_RDWR);

  if (file < 0 && errno == ENOENT) {
    sprintf(filename, "/dev/i2c-%d", i2cbus);
    file = open(filename, O_RDWR);
  }

  if (file < 0 && !quiet) {
    if (errno == ENOENT) {
      fprintf(stderr, "Error: Could not open file `/dev/i2c-%d' or `/dev/i2c/%d': %s\n", i2cbus, i2cbus, strerror(ENOENT));
    } else {
      fprintf(stderr, "Error: Could not open file `%s': %s\n", filename, strerror(errno));
      if (errno == EACCES){
        fprintf(stderr, "Run as root?\n");
      }
    }
  }
  return file;
}

int main(int argc, char** argv)
{

  if(argc != 2) {
    fprintf(stderr, "Error: invalid number of arguments. %s <speed>\n", argv[0]);
    return -1;
  }
  
  uint8_t freq = atoi(argv[1]);

  int file;
  char filename[20];
  int res;

  // Open connection to i2c
  file = open_i2c_dev(0, filename, 1);
  if(file < 0) {
    exit(1);
  }

  // Set the address to be 7 bits long
  if(ioctl(file, I2C_TENBIT, 0) < 0) {
    fprintf(stderr, "Error: could not set 7 bit address: %s\n", strerror(errno));
    return -1;
  }

  // Set the slave address to 0x48
  if(ioctl(file, I2C_SLAVE, S_ADDR) < 0) {
    if(errno == EBUSY) {
      printf("UU ");
    } else {
      fprintf(stderr, "Error: could not set address to 0x%02x: %s\n", S_ADDR, strerror(errno));
      return -1;
    }
  }

  // Write the pwm to the slave.
  res = i2c_smbus_write_byte(file, freq);
  
  // Clean up
  close(file);

  return 0;
}

