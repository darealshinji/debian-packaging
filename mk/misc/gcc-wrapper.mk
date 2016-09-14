CXX ?= g++
CXXFLAGS ?= -O3
LDFLAGS ?= -s
LDFLAGS += -static-libgcc -static-libstdc++

COMPILE = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
GCCPREFIX ?= gcc6opt-

SRC = gcc-wrapper.cpp
BINS = gcc-static1 g++-static1 g++-static2 g++-static3


all: $(BINS)

clean:
	-rm -f $(BINS)

gcc-static1: $(SRC)
	$(COMPILE) -DGCCDRIVER=\"$(GCCPREFIX)gcc\" -DSTATIC=1 $< -o $@

g++-static1: $(SRC)
	$(COMPILE) -DGCCDRIVER=\"$(GCCPREFIX)g++\" -DSTATIC=1 $< -o $@

g++-static2: $(SRC)
	$(COMPILE) -DGCCDRIVER=\"$(GCCPREFIX)g++\" -DSTATIC=2 $< -o $@

g++-static3: $(SRC)
	$(COMPILE) -DGCCDRIVER=\"$(GCCPREFIX)g++\" -DSTATIC=3 $< -o $@

