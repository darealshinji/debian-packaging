include ../../mk/include.mk

deps   = git
srcpkg = mp4fpsmod

download:
	rm -rf $(builddir)
	git clone --depth 1 "https://github.com/nu774/mp4fpsmod.git" $(builddir)
	@ VER=`grep 'return' $(builddir)/src/version.cpp | cut -d '"' -f2`; \
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-'`; \
	VERSION="$${VER}+git$${latestcommit}"; $(changelog-entry)

