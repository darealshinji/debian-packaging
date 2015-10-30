include ../../mk/include.mk

deps       = git
builddir   = notepadqq
cleanfiles = notepadqq* CodeMirror*

download:
	git clone --depth 1 "https://github.com/notepadqq/notepadqq-packaging.git"
	git clone "https://github.com/notepadqq/notepadqq.git"
	mv notepadqq-packaging/Debian/debian $(builddir)
	git -C $(builddir) submodule init
	git -C $(builddir) submodule update
	./changelog-copyright.sh
	rm -rf $(builddir)/.git notepadqq-packaging
