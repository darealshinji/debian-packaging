SRCS = $(shell ls common/*.c) $(shell ls generated/*.c) $(shell ls linux/*.c)

OBJS = $(SRCS:%.c=%.o)

CC := gcc
LD := g++

CFLAGS += -g -O3 -Wall -Wextra -fPIC -std=c99 -Wno-unused-parameter \
	  -Icommon -Igenerated -Ilinux -I/usr/lib/jvm/default-java/include

LDFLAGS += -shared -Wl,-soname,$(LIB)  -Wl,-z,defs -Wl,--as-needed

LIBS += -pthread -ldl -lm -lX11 -lXext -lXcursor -lXrandr \
	-L/usr/lib/jvm/default-java/jre/lib/$(ARCH) -lawt -ljawt -ljava -lverify \
	-L/usr/lib/jvm/default-java/jre/lib/$(ARCH)/headless -lmawt \
	-L/usr/lib/jvm/default-java/jre/lib/$(ARCH)/server -ljvm

ARCH = i386
LIB = liblwjgl.so
ifeq ($(shell uname -p), x86_64)
ARCH = amd64
LIB = liblwjgl64.so
LIBS += -lXxf86vm
endif


all: $(LIB)

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

$(LIB): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -f $(OBJS) $(LIB)

