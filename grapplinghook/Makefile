include ../Makefile.inc

VERSION = $(shell dpkg-parsechangelog -SVersion)

deps = wget unzip
bin = GrapplingHook.tar.gz
bin_demo = GrapplingHook_Demo.tar.gz
lwjgl = lwjgl-source-2.2.2.zip

cleanfiles = $(bin_demo) $(lwjgl) lwjgl-source ghook.png
allcleanfiles = $(LOG) *.dsc $(builddir) $(cleanfiles) grapplinghook_$(VERSION).tar.gz
distcleanfiles = $(bin)

ifeq ($(wildcard $(bin)),$(bin))
download: ghook_full lwjgl
srcfiles = $(bin) lwjgl-source/src/native ghook.png
else
download: ghook_demo lwjgl
srcfiles = $(bin_demo) lwjgl-source/src/native ghook.png
endif

ghook_full:
	@echo ""
	@echo "Full version found."
	@echo ""
	@$(call verifysha256,$(bin),0ae76375303578ea458ea626cbcd703e84871991696e9503b17c5c752062dc4f)

ghook_demo:
	@echo ""
	@echo "Download demo version."
	@echo ""
	wget "http://ghook.speedrungames.com/download/$(bin_demo)"
	@$(call verifysha256,$(bin_demo),b1970af780ce6023f12b0689ec35bae4e4a806868ac9b48ad94e73a3452665bb)
	tar xvf $(bin_demo)
	mv GrapplingHook_Demo GrapplingHook
	rm $(bin_demo)
	tar cfz $(bin_demo) GrapplingHook
	rm -r GrapplingHook

lwjgl:
	wget -O $(lwjgl) 'http://downloads.sourceforge.net/project/java-game-lib/Official%20Releases/LWJGL%202.2.2/$(lwjgl)?r=&ts=1418789686'
	wget -O ghook.png "http://fs1.directupload.net/images/141216/kvgj7f7q.png"
	@$(call verifysha256, $(lwjgl), 634bff16316456328986fb51fe0eb8f4126a50070da5f2685d5324d750236e4d)
	unzip $(lwjgl) -d lwjgl-source
	cp liblwjgl.mk lwjgl-source/src/native/Makefile

