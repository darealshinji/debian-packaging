include ../../mk/include.mk

deps = git dh-autoreconf

download:
	rm -rf $(builddir)
	#git clone https://gitorious.org/dtsenc/dtsenc.git $(builddir)
	git clone --depth 1 https://github.com/darealshinji/dcaenc.git $(builddir)
	@ VER=`git -C $(builddir) describe --abbrev=0 --tags | tr -d 'v'`; \
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-'`; \
	VERSION="$${VER}+git$${latestcommit}"; $(changelog-entry)

