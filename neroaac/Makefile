include ../Makefile.inc

deps = unzip wget
bin = NeroAACCodec-1.5.1.zip
cleanfiles = neroaac $(bin)
sha256_1 = e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b

build: build-default

download:
	wget "ftp://ftp6.nero.com/tools/$(bin)"
	@ $(verifysha256)
	unzip $(bin) -d neroaac

