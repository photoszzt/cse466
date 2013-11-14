# Lab 5 part 3
# Joseph Godlewski, Zhiting Zhu

CC=gcc
CCFLAGS=-Wall -std-c99

all: sin_table.h amplitude_table.h

sin_table.h: gen_tab sin.config
	./gen_tab `cat sin.config`

amplitude_table.h: gen_amplitude amp.config
	./gen_amplitude `cat amp.config`

gen_tab: write_to_file.o
	$(CC) $(CFLAGS) -lm -o gen_tab gen_tab.c write_to_file.o

gen_amplitude: write_to_file.o
	$(CC) $(CFLAGS) -o gen_amplitude gen_amplitude.c write_to_file.o

write_to_file.o:
	$(CC) $(CFLAGS) -c write_to_file.c

clean:
	@rm -vf gen_tab gen_amplitude *_table.h *.o *~
