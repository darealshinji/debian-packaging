include ../../mk/include.mk

deps           = wget git
bpg-ver        = $(shell dpkg-parsechangelog -ldebian/changelog.in -SVersion)
png-ver        = 1.6.17
png-bin        = libpng-$(png-ver).tar.xz
x265-bin       = x265.tar.bz2
builddir       = libbpg-$(bpg-ver)
cleanfiles     = debian/changelog debian/changelog.new
changelog-file = debian/changelog.new
srcpkg         = libbpgmod

download:
	git clone --depth 1 'https://github.com/xooyoozoo/libbpg.git' $(builddir)
	@ $(call download,$(png-bin),http://downloads.sourceforge.net/project/libpng/libpng16/$(png-ver)/$(png-bin)?r=&ts=1433231117)
	@ $(call download,$(x265-bin),https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2)
	@ $(call verifysha256,$(png-bin),98507b55fbe5cd43c51981f2924e4671fd81fe35d52dc53357e20f2c77fa5dfd)
	tar xvf $(png-bin)
	tar xvf $(x265-bin)

	mv libpng-$(png-ver) $(builddir)/png
	mv multicoreware-x265-* $(builddir)/x265

	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION=$(bpg-ver)+git$$latestcommit; $(changelog-entry)
	cat debian/changelog.new debian/changelog.in > debian/changelog

	# force x265
	echo 'bpgenc_SOURCES += x265_glue.c' >> $(builddir)/Makefile.am

