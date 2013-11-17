CROSS=arm-linux-
ALSA=~/Y4/CSE466/cse466/lab5/alsa/alsalibfiles/usr/
CCFLAGS="-Wall -std=c99"

all: synth

synth: audio_interface.o
	make -f gen_tab.mk
	$(CROSS)gcc $(CCFLAGS) -L $(ALSA)lib/ -I  $(ALSA)include/ -lasound -o synth synth.c audio_interface.o

audio_interface.o:
	$(CROSS)gcc $(CCFLAGS) -L $(ALSA)lib/ -I $(ALSA)include/ -lasound -c audio_interface.c

clean:
	make -f gen_tab.mk clean
	@rm -vf synth *.o *~
