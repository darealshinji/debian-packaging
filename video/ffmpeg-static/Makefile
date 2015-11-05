include ../../mk/include.mk

deps     = wget
srcfiles = ffmpeg-static.tar.xz

BITS = 32
ifeq ($(ARCH), amd64)
BITS = 64
endif
BIN = $(shell wget -q -O - http://johnvansickle.com/ffmpeg/ | grep -e 'ffmpeg-git-' | grep -e '$(BITS)bit' | cut -d '>' -f2 | cut -d '<' -f1)

download:
	@ $(call download,ffmpeg-static.tar.xz,http://johnvansickle.com/ffmpeg/builds/$(BIN))
	mkdir -p tmp
	cd tmp && tar xf ../ffmpeg-static.tar.xz
	@ VERSION="`ls tmp | sed 's/64bit//; s/32bit//;' | tr -c -d '[0-9]'`"; $(changelog-entry)
	rm -rf tmp

