/***************************************************************************
copyright            : (C) by 2009 Guangzhou FriendlyaRM, in China
email                : capbily@163.com
website		 : http://www.arm9.net

 ***************************************************************************/

#include <stdio.h>
#include <fcntl.h>
#include <getopt.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "i2c-dev.h"


#define usage_if(a) do { do_usage_if( a , __LINE__); } while(0);
void do_usage_if(int b, int line)
{
  const static char *eeprog_usage =
    "I2C-24C08(256 bytes) Read/Write Program, ONLY FOR TEST!\n"
    "FriendlyARM Computer Tech. 2009\n";
  if(!b)
    return;
  fprintf(stderr, "%s\n[line %d]\n", eeprog_usage, line);
  exit(1);
}


#define die_if(a, msg) do { do_die_if( a , msg, __LINE__); } while(0);
void do_die_if(int b, char* msg, int line)
{
  if(!b)
    return;
  fprintf(stderr, "Error at line %d: %s\n", line, msg);
  fprintf(stderr, "	sysmsg: %s\n", strerror(errno));
  exit(1);
}

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

struct func
{
  long value;
  const char* name;
};

static const struct func all_func[] = {
  { .value = I2C_FUNC_I2C,
    .name = "I2C" },
  { .value = I2C_FUNC_SMBUS_QUICK,
    .name = "SMBus Quick Command" },
  { .value = I2C_FUNC_SMBUS_WRITE_BYTE,
    .name = "SMBus Send Byte" },
  { .value = I2C_FUNC_SMBUS_READ_BYTE,
    .name = "SMBus Receive Byte" },
  { .value = I2C_FUNC_SMBUS_WRITE_BYTE_DATA,
    .name = "SMBus Write Byte" },
  { .value = I2C_FUNC_SMBUS_READ_BYTE_DATA,
    .name = "SMBus Read Byte" },
  { .value = I2C_FUNC_SMBUS_WRITE_WORD_DATA,
    .name = "SMBus Write Word" },
  { .value = I2C_FUNC_SMBUS_READ_WORD_DATA,
    .name = "SMBus Read Word" },
  { .value = I2C_FUNC_SMBUS_PROC_CALL,
    .name = "SMBus Process Call" },
  { .value = I2C_FUNC_SMBUS_WRITE_BLOCK_DATA,
    .name = "SMBus Block Write" },
  { .value = I2C_FUNC_SMBUS_READ_BLOCK_DATA,
    .name = "SMBus Block Read" },
  { .value = I2C_FUNC_SMBUS_BLOCK_PROC_CALL,
    .name = "SMBus Block Process Call" },
  { .value = I2C_FUNC_SMBUS_PEC,
    .name = "SMBus PEC" },
  { .value = I2C_FUNC_SMBUS_WRITE_I2C_BLOCK,
    .name = "I2C Block Write" },
  { .value = I2C_FUNC_SMBUS_READ_I2C_BLOCK,
    .name = "I2C Block Read" },
  { .value = 0, .name = "" }
};

static void print_functionality(unsigned long funcs)
{
  int i;

  for (i = 0; all_func[i].value; i++) {
    printf("%-32s %s\n", all_func[i].name,
        (funcs & all_func[i].value) ? "yes" : "no");
  }
}

int main(int argc, char** argv)
{
  //////////////Variables I added
  int file;
  unsigned long funcs;
  char filename[20];
  int res;
  /////////////End Variables I added

  int op;

  op = 0;

  usage_if(argc != 2 || argv[1][0] != '-' || argv[1][2] != '\0');
  op = argv[1][1];

  file = open_i2c_dev(0, filename, 1);
  if(file < 0) {
    exit(1);
  }

  if(ioctl(file, I2C_FUNCS, &funcs) < 0) {
    fprintf(stderr, "Error: could not get the adapter functionality matrix: %s\n", strerror(errno));
    close(file);
    exit(1);
  }

  print_functionality(funcs);

  if(ioctl(file, I2C_TENBIT, 0) < 0) {
	fprintf(stderr, "Error: could not set 7 bit address: %s\n", strerror(errno));
      return -1;
  }
  
  /* Set Slave Address */
  if(ioctl(file, I2C_SLAVE, 0x48) < 0) {
    if(errno == EBUSY) {
      printf("UU ");
    } else {
      fprintf(stderr, "Error: could not set address to 0x%02x: %s\n", 0x01, strerror(errno));
      return -1;
    }
  }

  while (1) {
    res = i2c_smbus_write_byte(file, 0x03);
    //printf("res: %d\n", res);

    //res = i2c_smbus_write_byte_data(file, 1, 0xCD);
    //res = i2c_smbus_write_quick(file,I2C_SMBUS_WRITE);
    //printf("res: %d\n", res);

    //res = i2c_smbus_write_byte_data(file, 0, 0xFA);
    //res = i2c_smbus_write_quick(file,I2C_SMBUS_WRITE);
    //printf("res: %d\n", res);
  }
  close(file);

  return 0;
}

