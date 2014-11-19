include ../Makefile.inc

deps = 
cleanfiles = master.tar.gz UnityEngine2deb-master debian templates u2deb.sh


all: deps download build

nodeps: download build

build:
	tar xvf master.tar.gz
	mv UnityEngine2deb-master/debian .
	mv UnityEngine2deb-master/templates .
	mv UnityEngine2deb-master/u2deb.sh .
	echo "UnityEngine2deb-master/README.md" > debian/docs
	cp -f rules debian/ && chmod a+x debian/rules
	$(buildpackage)

download: clean
	wget "https://github.com/darealshinji/UnityEngine2deb/archive/master.tar.gz"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

