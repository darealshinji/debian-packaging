include ../../mk/include.mk

deps     = git
builddir = lab3d-sdl

download:
	git clone --depth 1 "https://github.com/jspenguin/lab3d-sdl.git"
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION="3.0+git$$latestcommit"; $(changelog-entry)

