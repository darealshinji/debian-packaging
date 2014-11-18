include ../Makefile.inc

deps = wget unzip
cleanfiles = build.log *.tar.gz *.zip icons icons-ega YHtWtG_EGA TheGame_2014-01-30

game = TheGame_2014-01-30.tar.gz
sha256_game1 = 83ed5a02d222d280e439355f381e1115736c9d14c83171ac25e6b211c59e6751
ega = YHtWtG_EGA.zip
sha256_ega1 = 476a90500101d995ff5cb41b5d8e6548721daf44eb4ae65ecf58c3ba6ca165d9


all: deps download build

nodeps: download build

build:
	tar xzvf $(game)
	unzip $(ega) -d YHtWtG_EGA
	$(buildpackage)

download:
	wget "http://www.piratehearts.com/builds/$(game)"
	wget "http://www.piratehearts.com/files/$(ega)"

	sha256_game2=$(sha256sum $(game) | head -c64) ;\
if [ $$sha256_game2 != $(sha256_game1) ] ; then \
    echo "$(game):" ;\
    echo "SHA256 checksum is $$sha256_game2 but should be $(sha256_game1)." ;\
    exit 1 ;\
fi

	sha256_ega2=$(sha256sum $(ega) | head -c64) ;\
if [ $$sha256_ega2 != $(sha256_ega1) ] ; then \
    echo "$(ega):" ;\
    echo "SHA256 checksum is $$sha256_ega2 but should be $(sha256_ega1)." ;\
    exit 1 ;\
fi

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

