include ../Makefile.inc

deps = git wget qtbase5-dev libqt5webkit5-dev libqt5svg5-dev
cleanfiles = notepadqq-packaging notepadqq CodeMirror* debian


all: deps download build

nodeps: download build

build:
	tar xvf CodeMirror.tar.gz
	mv notepadqq-packaging/Debian/debian notepadqq
	mv CodeMirror-master/* notepadqq/src/editor/libs/codemirror
	mv notepadqq/debian/changelog notepadqq/debian/changelog.in

	# create new Debian changelog entry
	latestcommit=$$(git -C notepadqq/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	VERSION=$$(git -C notepadqq/ describe --abbrev=0 --tags | sed -e 's/v//g') ;\
	echo "notepadqq ($$VERSION+git$$latestcommit-1~trusty) trusty; urgency=low" > changelog.new
	#echo "notepadqq ($$VERSION-1) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * Current git snapshot" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new notepadqq/debian/changelog.in > notepadqq/debian/changelog
	rm changelog.new

	@cd notepadqq && $(buildpackage)
	mv -f notepadqq/build.log .
	mv -f *.deb *.changes ../

download: clean
	git clone https://github.com/notepadqq/notepadqq-packaging.git
	git clone https://github.com/notepadqq/notepadqq.git
	wget -O CodeMirror.tar.gz "https://github.com/notepadqq/CodeMirror/archive/master.tar.gz"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

