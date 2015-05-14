BIN = patchelfmod

all: $(BIN)

clean:
	rm -f $(BIN)

distclean: clean

$(BIN):
	g++ -s -Wall -I. -o $@ patchelfmod.cpp

