CROSS=arm-linux-

all: syn_sin

syn_sin:
	$(CROSS)gcc -Wall -L ~/cse_466/labs/lab5/alsa/alsalibfiles/usr/lib/ -I  ~/cse_466/labs/lab5/alsa/alsalibfiles/usr/include/ -lasound -std=c99 -o syn_sin syn_sin.c

clean:
	@rm -vf syn_sin *.o *~
