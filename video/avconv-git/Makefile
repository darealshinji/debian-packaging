include ../../mk/include.mk

deps       = git
builddir   = libav
cleanfiles = $(builddir) debian/changelog

download:
	test -d $(builddir) || git clone --depth 1 git://git.libav.org/libav.git
	@ VERSION=7:$$(cd $(builddir) && echo `cat RELEASE`+`git describe --always 2> /dev/null` | tr '_' '~') ;\
	$(changelog-entry)

