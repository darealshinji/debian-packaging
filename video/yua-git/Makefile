include ../../mk/include.mk

deps           = git wget
builddir       = $(srcpkg)
changelog-file = changelog.new

download:
	git clone "https://github.com/darealshinji/yua.git"
	make -C $(builddir) download
	cp -f debian/Makefile $(builddir)

	mv $(builddir)/debian-upstream $(builddir)/debian
	mv $(builddir)/debian/changelog $(builddir)/debian/changelog.in

	latestcommit=$$(git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	yuaversion=$$(git -C $(builddir)/ describe --abbrev=0 --tags | cut -d- -f1 | sed -e 's/v//g') ;\
	@ VERSION=$$yuaversion+git$$latestcommit ; $(changelog-entry)
	cat changelog.new $(builddir)/debian/changelog.in > $(builddir)/debian/changelog

	rm -rf $(builddir)/.git $(builddir)/*.tar.bz2

