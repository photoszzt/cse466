#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/ioctl.h>

#include "frame_buf.h"

// open the frame buffer
static int fbfd = 0;                    // fb0 file descriptor
static struct fb_var_screeninfo vinfo;  // variable screen info
static struct fb_fix_screeninfo finfo;  // fixed screen info
static long int screensize = 0;
static char *fbp = 0;                   // mmap file pointer

int init_fb() {

  // Open the file for reading and writing
  fbfd = open("/dev/fb0", O_RDWR);
  if (fbfd == -1) {
    perror("Error: cannot open framebuffer device");
    return -1;
  }

  // Get fixed screen information
  if (ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo) == -1) {
    perror("Error reading fixed information");
    return -1;
  }

  // Get variable screen information
  if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo) == -1) {
    perror("Error reading variable information");
    return -1;
  }

  // Figure out the size of the screen in bytes
  screensize = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;

  // Map the device to memory
  fbp = (char *)mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED, fbfd, 0);
  if ((int)fbp == -1) {
    perror("Error: failed to map framebuffer device to memory");
    return -1;
  }
  return 0;
}

void write_grid() {
  int x, y;
  // Figure out where in memory to put the pixel
  for (y = 0; y < vinfo.yres; y++) {
    for (x = 0; x < vinfo.xres; x++) {

      long int location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
        (y+vinfo.yoffset) * finfo.line_length;
      int b = 31;
      int g = 31;
      int r = 31;
      if(x % 4 == 0 || y % 4 == 0 || x % 20 == 19 || x % 20 == 1 || y % 20 == 19 || y % 20 == 1) {
        b = 15;
        g = 15;
        r = 15;
      }
      unsigned short int t = r<<11 | g << 5 | b;
      *((unsigned short int*)(fbp + location)) = t;

    }
  }
}

/*
 * Writes a line to the screen with the given element as the current reading on the
 * heartrate monitor.
 * Returns the next y value to use.
 */
int write_line(int element, int prev, int y) {
  // convert element to a position on the x-axis
  int pos = (int)((double)element * (vinfo.xres / 1024.0));
  int prev_pos = (int)((double)prev * (vinfo.xres / 1024.0));
  // write out the point to the screen
  int x = 0;
  for (x = 0; x < vinfo.xres; x++) {
    long int location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) + 
      (y+vinfo.yoffset) * finfo.line_length;
    int b = 31;
    int g = 31;
    int r = 31;
    if(x % 4 == 0 || y % 4 == 0 || x % 20 == 19 || x % 20 == 1 || y % 20 == 19 || y % 20 == 1) {
      // grid piece
      b = 15;
      g = 15;
      r = 15;
    } 
    if ((x >= pos - 0 && x <= prev_pos + 0) || (x >= prev_pos - 0 && x <= pos + 0)) {
      // element
      b = 0;
      g = 0;
      r = 0;
    }
    unsigned short int t = r<<11 | g << 5 | b;
    *((unsigned short int*)(fbp + location)) = t;
  }
  // update our line position
  if(y == vinfo.yres - 1) {
     y = -1;
  }
  y++;
  return y;
}

void cleanup_fb() {
  munmap(fbp, screensize);
  close(fbfd);
}

