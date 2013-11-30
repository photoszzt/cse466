#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <linux/fb.h>
#include <sys/mman.h>
#include <sys/ioctl.h>

// Note FB is 240x320px at 16bpp

void write_fb(struct fb_var_screeninfo, struct fb_fix_screeninfo, char *);

int main(int argc, char** argv) {

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
  printf("The framebuffer device was opened successfully.\n");

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


  for(;;) {
    char buffer[30];
    int len = read(fd, buffer, sizeof buffer -1);
    if (len > 0) {
      buffer[len] = '\0';
      int value = -1;
      sscanf(buffer, "%d", &value);
      printf("ADC Value: %d\n", value);
    } else {
      perror("read ADC device:");
      return 1;
    }
    write_fb(vinfo, finfo, fbp);
    usleep(4000);
  }

  close(fd);
  munmap(fbp, screensize);
  close(fbfd);
}

void write_fb(struct fb_var_screeninfo vinfo, struct fb_fix_screeninfo finfo, char *fbp) {
  int x, y;
  // Figure out where in memory to put the pixel
  for (y = 0; y < vinfo.yres; y++) {
    for (x = 0; x < vinfo.xres; x++) {

      long int location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
        (y+vinfo.yoffset) * finfo.line_length;
      int b = 31;
      int g = 31;
      int r = 31;
      if(x % 4 == 0 || y % 4 == 0) {
        b = 0;
        g = 0;
        r = 0;
      }
      unsigned short int t = r<<11 | g << 5 | b;
      *((unsigned short int*)(fbp + location)) = t;

    }
  }
}
