include ../../mk/include.mk

deps       = wget
bin        = SendSpace_Wizard_Debian-Linux-32-64bit.tgz
cleanfiles = $(bin) wizard patchelfmod*
srcfiles   = wizard patchelfmod.tar.gz

download:
	@ $(call download,patchelfmod.tar.gz,https://github.com/darealshinji/patchelfmod/archive/master.tar.gz)
	@ $(call download,$(bin),http://www.sendspace.com/pro/dl/bb0pg3)
	@ $(call verifysha256,$(bin),b95032d3932939522fc00c55b08e1cbd3aa2fdf62d1f0362aaf9e0a29c36cfcf)
	tar xvf $(bin)

