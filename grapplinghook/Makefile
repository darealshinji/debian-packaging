include ../Makefile.inc

VERSION = $(shell dpkg-parsechangelog -SVersion)

deps = wget unzip
bin = GrapplingHook.tar.gz
lwjgl = lwjgl-source-2.2.2.zip

srcfiles = $(bin) lwjgl-source/src/native ghook.png
cleanfiles = $(lwjgl) lwjgl-source ghook.png
allcleanfiles = $(LOG) *.dsc $(builddir) $(cleanfiles) grapplinghook_$(VERSION).tar.gz
distcleanfiles = $(bin)

download:
	@if [ ! -f $(bin) ] ; then \
	    echo "Can't find '$(bin)'" ;\
	    exit 1 ;\
	fi
	wget -O $(lwjgl) 'http://downloads.sourceforge.net/project/java-game-lib/Official%20Releases/LWJGL%202.2.2/$(lwjgl)?r=&ts=1418789686'
	wget -O ghook.png "http://fs1.directupload.net/images/141216/kvgj7f7q.png"
	@$(call verifysha256, $(lwjgl), 634bff16316456328986fb51fe0eb8f4126a50070da5f2685d5324d750236e4d)
	unzip $(lwjgl) -d lwjgl-source
	cp liblwjgl.mk lwjgl-source/src/native/Makefile
