# Makefile for AllegroFont using FreeType 2

CC := gcc

TARGETFLAGS = $(CFLAGS) $(CPPFLAGS) -Wall -O2 \
	-Wno-maybe-uninitialized -Wno-strict-overflow \
	-fomit-frame-pointer -finline-functions -ffast-math \
	-I. `freetype-config --cflags` `allegro-config --cflags`


all: libalfont.a

libalfont.a: alfont.o
	ar cru $@ $^

%.o: %.c
	$(CC) $(TARGETFLAGS) -c -o $@ $<

clean:
	rm -f libalfont.a *.o

