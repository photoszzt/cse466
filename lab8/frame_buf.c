// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 8 part 2 - 4

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

void clear_hr() {
  int x, y;
  for (y = 0; y < 50; y++) {
    for (x = vinfo.xres - 80; x < vinfo.xres; x++) {
      long int location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) + 
        (y+vinfo.yoffset) * finfo.line_length;
      int b = 31;
      int g = 31;
      int r = 31;
      unsigned short int t = r<<11 | g << 5 | b;
      *((unsigned short int*)(fbp + location)) = t;
    }
  }
}

void draw_seg(int i, int l) {
  int q = vinfo.xres - 80 + l;
  int x, y;
  switch(i) {
    case 1:
      for(y = 1; y < 20 - 1; y++) {
          long int location = (q+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
            (y+vinfo.yoffset + 5) * finfo.line_length;
          int b = 0;
          int g = 0;
          int r = 0;
          unsigned short int t = r<<11 | g << 5 | b;
          *((unsigned short int*)(fbp + location)) = t;
      }
      break;
    case 2:
      for(x = 1; x < 20 - 1; x++) {
          long int location = (q+x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
            (vinfo.yoffset + 5) * finfo.line_length;
          int b = 0;
          int g = 0;
          int r = 0;
          unsigned short int t = r<<11 | g << 5 | b;
          *((unsigned short int*)(fbp + location)) = t;
      }
      break;
    case 3:
      for(y = 1; y < 20 - 1; y++) {
          long int location = (q+vinfo.xoffset+(20-1)) * (vinfo.bits_per_pixel/8) +
            (y+vinfo.yoffset + 5) * finfo.line_length;
          int b = 0;
          int g = 0;
          int r = 0;
          unsigned short int t = r<<11 | g << 5 | b;
          *((unsigned short int*)(fbp + location)) = t;
      }
      break;
    case 4:
      for(x = 1; x < 20 - 1; x++) {
          long int location = (q+x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
            (vinfo.yoffset + 5 + 20) * finfo.line_length;
          int b = 0;
          int g = 0;
          int r = 0;
          unsigned short int t = r<<11 | g << 5 | b;
          *((unsigned short int*)(fbp + location)) = t;
      }
      break;
    case 5:
      for(y = 1; y < 20 - 1; y++) {
          long int location = (q+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
            (y+vinfo.yoffset + 5 + 20) * finfo.line_length;
          int b = 0;
          int g = 0;
          int r = 0;
          unsigned short int t = r<<11 | g << 5 | b;
          *((unsigned short int*)(fbp + location)) = t;
      }
      break;
    case 6:
      for(x = 1; x < 20 - 1; x++) {
          long int location = (q+x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
            (vinfo.yoffset + 5 + (2 * 20)) * finfo.line_length;
          int b = 0;
          int g = 0;
          int r = 0;
          unsigned short int t = r<<11 | g << 5 | b;
          *((unsigned short int*)(fbp + location)) = t;
      }
      break;
    case 7:
      for(y = 1; y < 20 - 1; y++) {
          long int location = (q+vinfo.xoffset+(20-1)) * (vinfo.bits_per_pixel/8) +
            (y+vinfo.yoffset + 5 + 20) * finfo.line_length;
          int b = 0;
          int g = 0;
          int r = 0;
          unsigned short int t = r<<11 | g << 5 | b;
          *((unsigned short int*)(fbp + location)) = t;
      }
      break;
  }
}

void draw_num(int num, int index) {
  int i = 0;
  int location = 5 * (1 + index) + index * 20;
  switch(num) {
    case 0:
      for(i = 1; i < 8; i++) {
        if(i != 4) {
          draw_seg(i, location); 
        }
      }
      break;
    case 1:
      draw_seg(3, location);
      draw_seg(7, location);
      break;
    case 2:
      for(i = 2; i < 7; i++)
        draw_seg(i, location);
      break;
    case 3:
      for(i = 2; i < 8; i++) {
        if(i != 5) {
          draw_seg(i, location); 
        }
      }
      break;
    case 4:
      draw_seg(1, location);
      draw_seg(3, location);
      draw_seg(4, location);
      draw_seg(7, location);
      break;
    case 5:
      draw_seg(1, location);
      draw_seg(2, location);
      draw_seg(4, location);
      draw_seg(6, location);
      draw_seg(7, location);
      break;
    case 6:
      for(i = 1; i < 8; i++) {
        if(i != 3) {
          draw_seg(i, location); 
        }
      }
      break;
    case 7:
      draw_seg(2, location);
      draw_seg(3, location);
      draw_seg(7, location);
      break;
    case 8:
      for(i = 1; i < 8; i++)
        draw_seg(i, location);
      break;
    case 9:
      for(i = 1; i < 8; i++) {
        if(i != 5) {
          draw_seg(i, location); 
        }
      }
      break;
    case -1:
      draw_seg(4, location);
  }
}

void write_heart_rate(int hr) {
  int nums[3];
  nums[0] = (hr/100) % 10;
  nums[1] = (hr/10) % 10;
  nums[2] = hr % 10;
  int i;
  for(i = 0; i < 3; i++) {
    draw_num(nums[i], i);
  }
}

void cleanup_fb() {
  munmap(fbp, screensize);
  close(fbfd);
}

