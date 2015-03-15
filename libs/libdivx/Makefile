include ../../mk/include.mk

ARCH           = i386
deps           = wget
dir            = divx611-20060201-gcc4.0.1
bin            = $(dir).tar.gz
builddir       = $(dir)
distcleanfiles = $(bin)
allcleanfiles  = $(LOG) libdivx_6.1.1.tar.gz *.build *.changes *.deb *.dsc $(builddir) $(cleanfiles)


download:
	@ $(call download,$(bin),http://ftp.arm.slackware.com/slacky/slackware-13.0/libraries/divx/6.1.1/src/$(bin))
	@ $(call download,patchelfmod.tar.gz,https://github.com/darealshinji/patchelfmod/archive/master.tar.gz)
	@ $(call verifysha256,$(bin),06d0d12ae55a1883c1fa2712a5dffbfaa9b76a7a6ccb235bafc350aab6170ce9)
	tar xfv $(bin)
	mv patchelfmod.tar.gz $(dir)

