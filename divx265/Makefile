include ../Makefile.inc

deps = imagemagick unzip wget
cleanfiles = DivX265

VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | head -c-2 | tail -c+2)
sha256_1 = f1887ba3ef72f47ed0330eb40751e6e966653b84fc2035fd08c1b22b0f2e62ef
bin = DivX265_$(VERSION)


all: deps download build

nodeps: download build

build:
	mv $(bin) DivX265
	chmod 0755 DivX265
	@$(buildpackage)

download:
	wget "http://download.divx.com/hevc/$(bin)"
	@sha256_2=$$(sha256sum $(bin) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(bin):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$(bin)' and try it again." ;\
    exit 1 ;\
fi

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

