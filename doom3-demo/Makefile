include ../Makefile.inc

deps = imagemagick wget
cleanfiles = temp converted_icons *.png

sha256_1 = b42260fd08feb13c2f035a3746f8c1e3472151f0f781b8a2d1da231dae818083
bin = doom3-linux-1.1.1286-demo.x86.run


all: deps download build

nodeps: download build

build:
	$(buildpackage)

download:
	test -f $(bin) || wget "ftp://ftp.fu-berlin.de/pc/games/idgames/idstuff/doom3/linux/$(bin)"
	@sha256_2=$$(sha256sum $(bin) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(bin):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$$bin' and try it again." ;\
    exit 1 ;\
fi
	wget -O doom3-demo.png "http://s14.directupload.net/images/141118/83e95wug.png"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

distclean: clean
	rm -f $(bin)

