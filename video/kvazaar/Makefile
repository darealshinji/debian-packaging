include ../../mk/include.mk

deps = git

download:
	rm -rf $(builddir)
	git clone --depth 1 "https://github.com/ultravideo/kvazaar.git" $(builddir)
	@ VER=`grep 'KVZ_VERSION' $(builddir)/src/global.h | head -n1 | cut -d ' ' -f3`; \
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-'`; \
	VERSION="$${VER}+git$${latestcommit}"; $(changelog-entry)
	sed -i 's/-Werror//g' $(builddir)/src/Makefile

