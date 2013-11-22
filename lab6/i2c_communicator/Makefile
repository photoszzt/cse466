CFLAGS= -Wall -O2
CC=arm-linux-gcc

i2c: i2c_arm.o
	$(CC) $(CFLAGS) -o lab6Master i2c_arm.o

clean: 
	rm -f lab6Master i2c_arm.o

