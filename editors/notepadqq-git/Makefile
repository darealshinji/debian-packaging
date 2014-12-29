include ../../Makefile.inc

deps = git
builddir = notepadqq
cleanfiles = notepadqq* CodeMirror*

download:
	git clone --depth 1 "https://github.com/notepadqq/notepadqq-packaging.git"
	git clone "https://github.com/notepadqq/notepadqq.git"
	mv notepadqq-packaging/Debian/debian notepadqq
	git -C notepadqq submodule init
	git -C notepadqq submodule update

	./changelog.sh
	rm -rf notepadqq/.git

