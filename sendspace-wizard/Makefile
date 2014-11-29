include ../Makefile.inc

deps = wget dh-autoreconf
cleanfiles = wizard $(bin) patchelfmod.tar.gz patchelfmod-master
sha256_1 = b95032d3932939522fc00c55b08e1cbd3aa2fdf62d1f0362aaf9e0a29c36cfcf
bin = SendSpace_Wizard_Debian-Linux-32-64bit.tgz

download:
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	wget -O $(bin) "http://www.sendspace.com/pro/dl/bb0pg3"
	@ $(verifysha256)
	tar xzvf $(bin)

