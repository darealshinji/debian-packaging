include ../Makefile.inc

deps = 
cleanfiles = master.tar.gz UnityEngine2deb-master


all: deps download build

nodeps: download build

build:
	tar xvf master.tar.gz
	@ cd UnityEngine2deb-master && $(buildpackage)
	mv -f UnityEngine2deb-master/build.log .
	mv -f *.deb *.changes ../

download: clean
	wget "https://github.com/darealshinji/UnityEngine2deb/archive/master.tar.gz"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

