include ../../Makefile.inc

deps = wget unzip
cleanfiles = *.png
distcleanfiles = Asylum-Teaser-master
srcfiles = Asylum-Teaser-master files *.png

download:
	test -d Asylum-Teaser-master && true || ( \
	wget "https://github.com/Senscape/Asylum-Teaser/archive/master.tar.gz" ;\
	tar xvf master.tar.gz ;\
	wget -O asylum-teaser.png "http://s14.directupload.net/images/141112/cbqmarg3.png" ;\
	cd Asylum-Teaser-master && ./download-game-content.sh )

