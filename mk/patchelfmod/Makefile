BIN = patchelfmod

all: $(BIN)

clean:
	rm -f $(BIN)

distclean: clean

$(BIN):
	g++ -s -w -I. -o $@ patchelfmod.cpp

