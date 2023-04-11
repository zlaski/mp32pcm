# To use the Intel compiler
#CC=icc
#CFLAGS= -O3 -axW -tpp7 -align -ip -rcd
#

# To use the GNU compiler
CC = gcc
CFLAGS= -O3 -fomit-frame-pointer -malign-double -ffast-math -Wall
#

# Where the sources are located
SRC=..




# To compile the example program with precompiled perform.s
example: $(SRC)/example.c  $(SRC)/mp32pcm.c  $(SRC)/perform.s\
	 $(SRC)/mp32pcm.h  $(SRC)/tables.h  $(SRC)/huffman.h
	$(CC) $(CFLAGS)  $(SRC)/example.c  $(SRC)/mp32pcm.c  $(SRC)/perform.s -o example

# To compile the example program completely from C sources
example: $(SRC)/example.c  $(SRC)/mp32pcm.c  $(SRC)/perform.c\
	 $(SRC)/mp32pcm.h  $(SRC)/tables.h  $(SRC)/huffman.h
	$(CC) $(CFLAGS)  $(SRC)/example.c  $(SRC)/mp32pcm.c  $(SRC)/perform.c -o example


# To compile the hex2hex decoder
hex2hex: $(SRC)/hex2hex.c $(SRC)/mp32pcm.c  $(SRC)/perform.c\
	 $(SRC)/mp32pcm.h  $(SRC)/tables.h  $(SRC)/huffman.h
	$(CC) $(CFLAGS) $(SRC)/hex2hex.c $(SRC)/mp32pcm.c $(SRC)/perform.c -o hex2hex

# To compile the program computing rms values.
rms: $(SRC)/rms.c $(SRC)/mp32pcm.c  $(SRC)/perform.c\
	 $(SRC)/mp32pcm.h  $(SRC)/tables.h  $(SRC)/huffman.h
	$(CC) $(CFLAGS) $(SRC)/rms.c $(SRC)/mp32pcm.c $(SRC)/perform.c -o rms


# To test compliance with the files fl8.mpg and fl8.pcm supplied by the standard
fl8.out: hex2hex rms fl8.mpg fl8.pcm
	hex2hex < layer1/fl8.mpg > fl8.out
	rms 2 fl8.out layer1/fl8.pcm

# to make the table generator
mktables:  $(SRC)/mktables.c  $(SRC)/mp32pcm.h
	$(CC)  $(SRC)/mktables.c -lm -o mktables

# and with the table generator, the tables.
$(SRC)/tables.h: mktables
	mktables >  $(SRC)/tables.h

# to make the generator for the huffan tables
mkhuff: $(SRC)/mkhuff.c
	$(CC)  $(SRC)/mkhuff.c -lm -o mkhuff


# and with the generator, the huffman tables
$(SRC)/huffman.h: mkhuff $(SRC)/huffcode
	mkhuff
	cp huffman.h ..


