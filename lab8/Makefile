CFLAGS= -Wall -O2
CC=arm-linux-gcc

heart: heart.o io_handler.o filter.o frame_buf.o
	$(CC) $(CFLAGS) -o heart heart.o io_handler.o filter.o frame_buf.o

clean: 
	rm -f heart *.o

