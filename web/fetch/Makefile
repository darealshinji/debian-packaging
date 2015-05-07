include ../../mk/include.mk

deps     = git dh-autoreconf
builddir = fetch

download:
	rm -rf $(builddir)
	git clone --depth 1 "https://github.com/darealshinji/fetch.git"
	@ VER=`cat $(builddir)/source/VERSION`; \
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION="$${VER}+git$${latestcommit}"; $(changelog-entry)
