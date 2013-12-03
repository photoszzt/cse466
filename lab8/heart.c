#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/ioctl.h>

#define NZEROS 4
#define NPOLES 4
#define GAIN   5.458037903e+03

// Note FB is 240x320px at 16bpp

void stabilize(int); 
void monitor_heart_rate(struct fb_var_screeninfo, struct fb_fix_screeninfo, char *, int);
int get_value(int);
void write_grid(struct fb_var_screeninfo, struct fb_fix_screeninfo, char *);
void write_line(struct fb_var_screeninfo, struct fb_fix_screeninfo, char *, int, int, int);
int filter(int);

float xv[NZEROS+1], yv[NPOLES+1];

int main(int argc, char** argv) {
  
  // remap stdin, stdout, stderr

  
  // open the adc
  int fd = open("/dev/adc", 0);
  if (fd < 0) {
    perror("fail to open ADC device:");
    return 1;
  }

  // open the frame buffer
  int fbfd = 0;                    // fb0 file descriptor
  struct fb_var_screeninfo vinfo;  // variable screen info
  struct fb_fix_screeninfo finfo;  // fixed screen info
  long int screensize = 0;
  char *fbp = 0;                   // mmap file pointer

  // Open the file for reading and writing
  fbfd = open("/dev/fb0", O_RDWR);
  if (fbfd == -1) {
    perror("Error: cannot open framebuffer device");
    exit(1);
  }

  // Get fixed screen information
  if (ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo) == -1) {
    perror("Error reading fixed information");
    exit(2);
  }

  // Get variable screen information
  if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo) == -1) {
    perror("Error reading variable information");
    exit(3);
  }

  // Figure out the size of the screen in bytes
  screensize = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;

  // Map the device to memory
  fbp = (char *)mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED, fbfd, 0);
  if ((int)fbp == -1) {
    perror("Error: failed to map framebuffer device to memory");
    exit(4);
  }
  // stabilize
  // stabilize(fd);
  printf("stabilized");

  // signal stabilized, can execute
  monitor_heart_rate(vinfo, finfo, fbp, fd);

  // cleanup
  close(fd);
  munmap(fbp, screensize);
  close(fbfd);
  return 0;
}

void stabilize(int fd) {
  int period = -1;
  int num_correct = 0;
  int max = 700;
  int min = 350;
  int time = 0;
  int prev = 0;
  int thresh = 500;
  int avg = 0;
  while(1) {
    usleep(4000);
    if (time < 50) {
      time++;
      continue;
    }
    int value = get_value(fd);
    if (value > max || value < min) {
      num_correct = 0;
      period = -1;
      prev = value;
      continue;
    }
    if (value > prev && value > thresh && prev < thresh) {
      if (period == -1) {
        period = time;
        prev = value;
        continue; 
      }  
      if (period + 10 >= time && time >= period - 10) {
        num_correct++;
        time = 0;
      }
      if (num_correct >= 3) {
        break;
      }
    } else {
      if(avg == 0) {
        avg = value;
      } else {
        avg = (avg + value)/2;
        printf("Avg = %d\n", avg);
      }
    }
    prev = value;
    time++;
  }


}

void monitor_heart_rate(struct fb_var_screeninfo vinfo, struct fb_fix_screeninfo finfo, 
                        char *fbp, int fd) {
  int prev = vinfo.xres/2;
  int i = 0;
  int j = 0;
  write_grid(vinfo, finfo, fbp);
  int values[7500];
  for(j = 0;j < 7500; j++) {
    // Get the adc value
    int value = get_value(fd);
    if (j < 4) {
      xv[j+1] = value;
      yv[j+1] = value;
    } else {
      value = filter(value);
    }
    values[j] = value;
    // write out samples every 0.008 sec (every 2 cycles)
    if(j % 2 == 1) {
      value = (value + values[j - 1]) / 2; // get avg of this and previous
      write_line(vinfo, finfo, fbp, value, prev, i);
      // update our line position
      if(i == vinfo.yres - 1) {
        i = -1;
      }
      i++;
      prev = value;
    }
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

void write_grid(struct fb_var_screeninfo vinfo, struct fb_fix_screeninfo finfo, char *fbp) {
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
 */
void write_line(struct fb_var_screeninfo vinfo, struct fb_fix_screeninfo finfo, 
    char *fbp, int element, int prev, int y) {
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
}

int filter(int input) {
  xv[0] = xv[1]; xv[1] = xv[2]; xv[2] = xv[3]; xv[3] = xv[4]; 
  xv[4] = input / GAIN;
  yv[0] = yv[1]; yv[1] = yv[2]; yv[2] = yv[3]; yv[3] = yv[4]; 
  yv[4] =   (xv[0] + xv[4]) + 4 * (xv[1] + xv[3]) + 6 * xv[2]
    + ( -0.5174781998 * yv[0]) + (  2.4093428566 * yv[1])
    + ( -4.2388639509 * yv[2]) + (  3.3440678377 * yv[3]);
  return (int) yv[4];
}


