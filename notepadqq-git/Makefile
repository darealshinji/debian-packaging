include ../Makefile.inc

deps = git wget qtbase5-dev libqt5webkit5-dev libqt5svg5-dev
cleanfiles = notepadqq-packaging notepadqq CodeMirror*


all: deps download build

nodeps: download build

build:
	find notepadqq -type f -name *.js -exec chmod 0644 '{}' \;
	@cd notepadqq && $(buildpackage)
	mv -f notepadqq/build.log .
	mv -f *.deb *.changes ../

download: clean
	git clone https://github.com/notepadqq/notepadqq-packaging.git
	git clone https://github.com/notepadqq/notepadqq.git
	wget -O CodeMirror.tar.gz "https://github.com/notepadqq/CodeMirror/archive/master.tar.gz"

	tar xvf CodeMirror.tar.gz
	mv notepadqq-packaging/Debian/debian notepadqq
	[ -f notepadqq/src/editor/libs/codemirror/mode/makefile/makefile.js ] || \
	  cp -r patches notepadqq/debian
	mv CodeMirror-master/* notepadqq/src/editor/libs/codemirror

	# create new Debian changelog entry
	./changelog.sh

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

