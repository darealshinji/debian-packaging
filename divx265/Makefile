include ../Makefile.inc

deps = imagemagick unzip wget
cleanfiles = DivX265 $(bin)

VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | head -c-2 | tail -c+2)
sha256_1 = f1887ba3ef72f47ed0330eb40751e6e966653b84fc2035fd08c1b22b0f2e62ef
bin = DivX265_$(VERSION)

build: build-default

download:
	wget "http://download.divx.com/hevc/$(bin)"
	$(verifysha256)
	mv $(bin) DivX265
	chmod 0755 DivX265

