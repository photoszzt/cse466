# Lab 5 part 3
# Joseph Godlewski, Zhiting Zhu

CC=gcc
CCFLAGS=-Wall -std-c99

all: gen_tab gen_amplitude

gen_tab: write_to_file.o
	$(CC) $(CFLAGS) -lm -o gen_tab gen_tab.c write_to_file.o

gen_amplitude: write_to_file.o
	$(CC) $(CFLAGS) -o gen_amplitude gen_amplitude.c write_to_file.o

write_to_file.o:
	$(CC) $(CFLAGS) -c write_to_file.c

clean:
	@rm -vf gen_tab gen_amplitude *.o *~
