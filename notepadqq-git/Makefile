include ../Makefile.inc

deps = git wget qtbase5-dev libqt5webkit5-dev libqt5svg5-dev
cleanfiles = notepadqq-packaging $(builddir) CodeMirror*
builddir = notepadqq
repo = https://github.com/notepadqq

download: clean
	git clone "$(repo)/notepadqq-packaging.git"
	git clone "$(repo)/notepadqq.git"
	wget -O CodeMirror.tar.gz "$(repo)/CodeMirror/archive/master.tar.gz"

	tar xvf CodeMirror.tar.gz
	mv notepadqq-packaging/Debian/debian $(builddir)
	[ -f $(builddir)/src/editor/libs/codemirror/mode/makefile/makefile.js ] || \
	  cp -r patches $(builddir)/debian
	mv CodeMirror-master/* $(builddir)/src/editor/libs/codemirror

	# create new Debian changelog entry
	./changelog.sh

