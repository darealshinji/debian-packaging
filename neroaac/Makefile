include ../Makefile.inc

deps = unzip wget
cleanfiles = neroaac *.zip

sha256_1 = e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b
zip = NeroAACCodec-1.5.1.zip


all: deps download build

nodeps: download build

build:
	rm -rf neroaac
	unzip $(zip) -d neroaac
	$(buildpackage)

download: deps
	wget "ftp://ftp6.nero.com/tools/$(zip)"
	@sha256_2=$$(sha256sum $(zip) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(zip):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$(zip)' and try it again." ;\
    exit 1 ;\
fi

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

