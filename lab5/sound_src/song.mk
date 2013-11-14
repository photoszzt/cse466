CROSS=arm-linux-
ALSA=~/Y4/CSE466/cse466/lab5/alsa/alsalibfiles/usr/
CCFLAGS="-Wall -std=c99"

all: song

song: audio_interface.o
	$(CROSS)gcc $(CCFLAGS) -L $(ALSA)lib/ -I  $(ALSA)include/ -lasound -o song song.c audio_interface.o

audio_interface.o:
	$(CROSS)gcc $(CCFLAGS) -L $(ALSA)lib/ -I $(ALSA)include/ -lasound -c audio_interface.c



clean:
	@rm -vf song *.o *~


