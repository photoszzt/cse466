CFLAGS= -Wall -O2
CC=arm-linux-gcc

i2c: eeprog.o
	$(CC) $(CFLAGS) -o i2c eeprog.o

clean: 
	rm -f i2c eeprog.o

