include ../Makefile.inc

deps = imagemagick unzip wget
cleanfiles = Serena *.txt *.png
sha256_1 = b25bbabad910db78c9446e2d293eb161588a7b2098713e77a512f8c10345f530
mirror = http://ams4.dl.dbolical.com/2014/02/01
bin = Serena.1.zip

build: build-default

download: clean
	@if [ ! -f $(bin) ] ; then \
    wget "$(mirror)/$(bin)" || ( \
        echo 'Automatic download failed!' && \
        echo 'Download the Windows zip archive manually,' && \
        echo 'save it in this directory and run `make` again:' && \
        echo 'http://www.indiedb.com/games/serena/downloads/serena' && \
        exit 1 \
    ) ;\
fi
	@ $(verifysha256)
	wget -O serena.png "http://s14.directupload.net/images/141116/9yoas6gx.png"
	unzip $(bin)

distclean: clean
	rm -f $(bin)

