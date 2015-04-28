include ../../mk/include.mk

deps           = wget
bin            = LAB3D-SDL-3.0-src.tgz
builddir       = LAB3D-SDL-3.0
distcleanfiles = $(bin)

download:
	@ $(call download,$(bin),http://s3.jspenguin.org/LAB3D-SDL-3.0-src.tar.gz)
	@ $(call download,CHANGELOG,https://jspenguin.org/software/lab3d_sdl/jspenguin-changes.txt)
	@ $(call verifysha256,$(bin),9b358dc75054e34c19e442a6af389415b1a2ae06780a1e6b11364467f40a5daf)
	tar xvf $(bin)
	mv CHANGELOG $(builddir)

