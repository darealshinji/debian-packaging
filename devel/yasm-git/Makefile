include ../../mk/include.mk

deps     = git dh-autoreconf autotools-dev
builddir = yasm

download:
	rm -rf $(builddir) && git clone --depth 1 "https://github.com/yasm/yasm.git"
	@ ver=`cd $(builddir) && ./YASM-VERSION-GEN.sh 2>&1`; \
	git=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION="$${ver}+git$${git}"; $(changelog-entry)

