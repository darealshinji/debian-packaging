include ../../mk/include.mk

deps = git

download:
	rm -rf $(builddir)
	git clone --depth 1 "https://github.com/ultravideo/kvazaar.git" $(builddir)
	@ VER=`grep 'VERSION_STRING' $(builddir)/src/global.h | cut -d '"' -f2`; \
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-'`; \
	VERSION="$${VER}+git$${latestcommit}"; $(changelog-entry)
	cp -f ../x264/debian/test.y4m.xz $(builddir)/debian/
	sed -i 's/-Werror//g' $(builddir)/src/Makefile

