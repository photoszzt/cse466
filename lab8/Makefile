CFLAGS= -Wall -O2
CC=arm-linux-gcc

heart: heart.o io_handler.o filter.o
	$(CC) $(CFLAGS) -o heart heart.o io_handler.o filter.o

clean: 
	rm -f heart *.o

