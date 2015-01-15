include ../../mk/include.mk

ARCH           = i386
deps           = wget
builddir       = $(DIR)
DIR            = divx611-20060201-gcc4.0.1
cleanfiles     = $(DIR)
distcleanfiles = $(DIR).tgz

download:
	test $(DIR).tgz || wget -O $(DIR).tgz "http://download.divx.com/labs/$(DIR).tar.gz"
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	tar xfv $(DIR).tgz
	mv patchelfmod.tar.gz $(DIR)

