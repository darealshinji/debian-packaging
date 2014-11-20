include ../Makefile.inc

deps = git dh-autoreconf libacl1-dev libattr1-dev
cleanfiles = patchelfmod debian changelog.new


all: deps download build

nodeps: download build

build:
	mv patchelfmod/debian-upstream patchelfmod/debian
	@ cd patchelfmod && $(buildpackage)
	mv -f patchelfmod/build.log .
	mv -f *.deb *.changes ../

download: clean
	git clone https://github.com/darealshinji/patchelfmod.git

	# create new Debian changelog entry
	mv patchelfmod/debian-upstream/changelog patchelfmod/debian-upstream/changelog.in
	latestcommit=$$(git -C patchelfmod/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	VERSION=$$(cat patchelfmod/version | tr -d "\n") ;\
	echo "patchelfmod ($$VERSION+git$$latestcommit-1) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * Current git snapshot" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new patchelfmod/debian-upstream/changelog.in > \
	patchelfmod/debian-upstream/changelog
	rm changelog.new

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

