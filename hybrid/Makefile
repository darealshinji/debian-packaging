include ../Makefile.inc

deps = wget libqt4-dev
cleanfiles = hybrid-*-master *.tar.gz

build:
	tar xvf hybrid-debian.tar.gz
	tar xvf hybrid-avisynth-extension.tar.gz
	@ cd hybrid-debian-master && $(buildpackage)
	@ cd hybrid-avisynth-extension-master && $(buildpackage)
	mv -f *.deb *.changes ../
	cat hybrid-debian-master/build.log \
	hybrid-avisynth-extension-master/build.log > build.log

download: clean
	wget -O hybrid-debian.tar.gz \
	"https://github.com/darealshinji/hybrid-debian/archive/master.tar.gz"
	wget -O hybrid-avisynth-extension.tar.gz \
	"https://github.com/darealshinji/hybrid-avisynth-extension/archive/master.tar.gz"

