include ../Makefile.inc

deps = wget
cleanfiles = $(bin)*
srcfiles = $(bin)

VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | head -c-2 | tail -c+2)
sha256_1 = f1887ba3ef72f47ed0330eb40751e6e966653b84fc2035fd08c1b22b0f2e62ef
bin = DivX265

download:
	wget -O $(bin) "http://download.divx.com/hevc/$(bin)_$(VERSION)"
	$(verifysha256)

