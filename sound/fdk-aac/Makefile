include ../../mk/include.mk

deps = git dh-autoreconf

download:
	rm -rf $(builddir)
	git clone git://git.code.sf.net/p/opencore-amr/fdk-aac $(builddir)
	@ VER=`git -C $(builddir) describe --abbrev=0 --tags | tr -d 'v'`; \
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-'`; \
	VERSION="$${VER}+git$${latestcommit}"; $(changelog-entry)

