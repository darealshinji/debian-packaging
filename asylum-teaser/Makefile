include ../Makefile.inc

deps = imagemagick unzip wget
cleanfiles = Asylum-Teaser-master asylum-teaser.png converted_icons

download:
	wget "https://github.com/Senscape/Asylum-Teaser/archive/master.tar.gz"
	tar xvf master.tar.gz
	rm master.tar.gz
	wget -O asylum-teaser.png "http://s14.directupload.net/images/141112/cbqmarg3.png"
	cd Asylum-Teaser-master && ./download-game-content.sh
