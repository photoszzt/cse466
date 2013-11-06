CROSS=arm-linux-

all: auplay

auplay:
	$(CROSS)gcc -L ~/cse_466/lab5/alsa/alsalibfiles/usr/lib/ -I  ~/cse_466/lab5/alsa/alsalibfiles/usr/include/ -lasound -o auplay auplay.c


clean:
	@rm -vf auplay *.o *~
