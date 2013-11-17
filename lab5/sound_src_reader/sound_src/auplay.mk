CROSS=arm-linux-
ALSA=~/Y4/CSE466/cse466/lab5/alsa/alsalibfiles/usr/
CCFLAGS="-Wall -std=c99"
all: auplay

auplay: audio_interface.o
	$(CROSS)gcc $(CCFLAGS) -L $(ALSA)lib/ -I  $(ALSA)include/ -lasound -o auplay auplay.c audio_interface.o

audio_interface.o:
	$(CROSS)gcc $(CCFLAGS) -L $(ALSA)lib/ -I $(ALSA)include/ -lasound -c audio_interface.c

clean:
	@rm -vf auplay *.o *~
