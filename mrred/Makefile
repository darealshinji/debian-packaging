include ../Makefile.inc

deps = imagemagick wget
cleanfiles = mrred.tar.gz mrred.png assets runner converted_icons

sha256_1 = ae0164bfc842a409016518985f8e1f11e07d4730209eb891a36d04135e283049
archive = mrred.tar.gz


all: deps download build

nodeps: download build

build:
	tar xzvf $(archive)
	$(buildpackage)

download: deps
	wget -O $(archive) "https://www.dropbox.com/s/z8b534gi6xxhgki/Mr%20Reds%20Adventure%20TMB.tar.gz?dl=1"
	@sha256_2=$$(sha256sum $(archive) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(archive):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$(archive)' and try it again." ;\
    exit 1 ;\
fi
	wget -O mrred.png "http://s14.directupload.net/images/140508/oslo47cn.png"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

