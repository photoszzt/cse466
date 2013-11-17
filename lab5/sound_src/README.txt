Joseph Godlewski and Zhiting Zhu
joe3701 and zzt0215
Lab 5

This directory contains the source code for our lab 5.
The audio_interface c files are used for all of the parts
since it provides a way to access the sound card.

Part 2:
For the auplayer (part 2) the auplay file is the main c file.
To make the executable (auplay), run: make auplay
auplay takes as a command line argument the .au file to play.

Part 3:
For the synthesizer (part 3) the main file is synth.c.
It also uses the gen_tab.c and gen_amplitude.c files to 
construct the sine table and amplitude envelope (respectively).
These table generators use the .config files to determine how
big to make the tables. 
  amp.config contains 4 ints determining the size of the 
attack, decay, sustain, and release sections in the envelope.
  sin.config contains one int that represents how big to make
the sine table.
To make the synthesizer (synth), run: make synth
synth takes as a command line argument the frequency to be
played.

Part 4:
For the song generator (part 4) the main file is song.c.
To make the executable (song), run: make song
song takes no command line arguments


NOTE:
If you want to make all of the executables, run: make
to clean up, use: make clean

