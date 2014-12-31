include ../../include.mk

deps = wget
srcfiles = ffmpeg-static.tar.xz
srcpkg = ffmpeg-static

BITS = 32
ifeq ($(shell uname -p), x86_64)
BITS = 64
endif
BIN = $(shell wget -q -O - http://johnvansickle.com/ffmpeg/ | grep -e 'ffmpeg-git-' | grep -e '$(BITS)bit' | cut -d '>' -f2 | cut -d '<' -f1)
DATE = $(shell echo $(BIN) | cut -d- -f3)

download:
	wget -O ffmpeg-static.tar.xz "http://johnvansickle.com/ffmpeg/builds/$(BIN)"
	VERSION=$(DATE); $(changelog-entry)

