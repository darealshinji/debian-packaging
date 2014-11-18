include ../Makefile.inc

deps = imagemagick unzip wget
cleanfiles = Serena "MUST READ EULA(End-user license agreement).txt" serena.png converted_icons

sha256_1 = b25bbabad910db78c9446e2d293eb161588a7b2098713e77a512f8c10345f530
zip = Serena.1.zip


all: deps download build

nodeps: download build

build:
	unzip $(zip)
	$(buildpackage)

download:
	@if [ ! -f $(zip) ] ; then \
    echo 'To build Serena download the Windows zip archive,' ;\
    echo 'save it in this directory and run `make` again:' ;\
    echo 'http://www.indiedb.com/games/serena/downloads/serena' ;\
    exit 1 ;\
fi
	@sha256_2=$$(sha256sum $(zip) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(zip):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$(zip)' and try it again." ;\
    exit 1 ;\
fi
	wget -O serena.png "http://s14.directupload.net/images/141116/9yoas6gx.png"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

distclean: clean
	rm -f $(zip)

