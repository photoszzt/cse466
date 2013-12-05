CFLAGS= -Wall -O2
CC=arm-linux-gcc

heart: heart.o io_handler.o filter.o frame_buf.o heart_rate.o
	$(CC) $(CFLAGS) -o heart heart.o io_handler.o filter.o frame_buf.o heart_rate.o

clean: 
	rm -f heart *.o

