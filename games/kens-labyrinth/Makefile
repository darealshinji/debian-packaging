include ../../mk/include.mk

deps           = git wget
tarball        = LAB3D-SDL-3.0-src.tgz
builddir       = lab3d-sdl
distcleanfiles = $(tarball)

download:
	@ $(call download,$(tarball),http://s3.jspenguin.org/LAB3D-SDL-3.0-src.tar.gz)
	git clone --depth 1 "https://github.com/jspenguin/lab3d-sdl.git"
	@ $(call verifysha256,$(tarball),9b358dc75054e34c19e442a6af389415b1a2ae06780a1e6b11364467f40a5daf)
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION="3.0+git$$latestcommit"; $(changelog-entry)
	cd $(builddir) && tar xvf ../$(tarball)
	rm -rf $(builddir)/.git

