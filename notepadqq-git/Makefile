include ../Makefile.inc

deps = git qtbase5-dev libqt5webkit5-dev libqt5svg5-dev
cleanfiles = notepadqq-packaging $(builddir) CodeMirror*
builddir = notepadqq
repo = https://github.com/notepadqq

build: build-default

download: clean
	git clone --depth 1 "$(repo)/notepadqq-packaging.git"
	git clone "$(repo)/notepadqq.git"
	mv notepadqq-packaging/Debian/debian $(builddir)
	git -C $(builddir) submodule init
	git -C $(builddir) submodule update

	# create new Debian changelog entry
	./changelog.sh

