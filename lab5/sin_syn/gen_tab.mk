all: gen_tab

gen_tab:
	gcc -Wall -std=c99 -lm -o gen_tab gen_tab.c write_to_file.c

clean:
	@rm -vf gen_tab *.o *~
