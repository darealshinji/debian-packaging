include ../../mk/include.mk

deps            = wget git
bpg-ver         = $(shell dpkg-parsechangelog -ldebian/changelog.in -SVersion)
png-ver         = 1.6.16
png-bin         = libpng-$(png-ver).tar.xz
builddir        = libbpg-$(bpg-ver)
cleanfiles      = debian/changelog debian/changelog.new
changelog-file  = debian/changelog.new
srcpkg          = libbpgmod

download:
	git clone --depth 1 'https://github.com/xooyoozoo/libbpg.git' $(builddir)
	wget -O $(png-bin) 'http://downloads.sourceforge.net/project/libpng/libpng16/$(png-ver)/$(png-bin)?r=&ts=1420631501'
	wget 'https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2'
	@$(call verifysha256,$(png-bin),42f754df633e4e700544e5913cbe2fd4928bbfccdc07708a5cf84e59827fbe60)
	tar xvf $(png-bin)
	tar xvf tip.tar.bz2

	mv libpng-$(png-ver) $(builddir)/png
	mv multicoreware-x265-* $(builddir)/x265
	cp -f debian/bpg.mk $(builddir)/Makefile
	cp -f debian/jctvc.mk $(builddir)/jctvc/Makefile

	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION=$(bpg-ver)+git$$latestcommit; $(changelog-entry)
	cat debian/changelog.new debian/changelog.in > debian/changelog

