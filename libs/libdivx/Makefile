include ../../mk/include.mk

ARCH           = i386
deps           = wget
dir            = divx611-20060201-gcc4.0.1
bin            = $(dir).tar.gz
builddir       = $(dir)
distcleanfiles = $(bin)
allcleanfiles  = $(LOG) libdivx_6.1.1.tar.gz *.build *.changes *.deb *.dsc $(builddir) $(cleanfiles)

mirrors = http://download.divx.com/labs/divx611-20060201-gcc4.0.1.tar.gz\n \
		http://www.mediafire.com/download/ffa6nkz0d2ggfg1/divx611-20060201-gcc4.0.1.tar.gz\n \
		http://www.filewatcher.com/m/divx611-20060201-gcc4.0.1.tar.gz.969808-0.html\n

download:
	@ test -f $(bin) || (printf "\n'$(bin)' not found!\n\ndownload from one of these mirrors:\n$(mirrors)\n"; exit 1)
	@ $(call download,patchelfmod.tar.gz,https://github.com/darealshinji/patchelfmod/archive/master.tar.gz)
	tar xfv $(bin)
	mv patchelfmod.tar.gz $(dir)

