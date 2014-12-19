include ../Makefile.inc

VERSION = $(shell dpkg-parsechangelog -SVersion)

deps = wget
bin = GrapplingHook.tar.gz
bin_demo = GrapplingHook_Demo.tar.gz
lwjgl = lwjgl-2.9.1.zip

cleanfiles = $(bin_demo) $(lwjgl) ghook.png
allcleanfiles = $(LOG) *.dsc $(builddir) $(cleanfiles) grapplinghook_$(VERSION).tar.gz
distcleanfiles = $(bin)

ifeq ($(wildcard $(bin)),$(bin))
download: ghook_full lwjgl
srcfiles = $(bin) $(lwjgl) ghook.png
else
download: ghook_demo lwjgl
srcfiles = $(bin_demo) $(lwjgl) ghook.png
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
	wget -O $(lwjgl) 'http://downloads.sourceforge.net/project/java-game-lib/Official%20Releases/LWJGL%202.9.1/$(lwjgl)?r=&ts=1419016399'
	wget -O ghook.png "http://fs1.directupload.net/images/141216/kvgj7f7q.png"
	@$(call verifysha256,$(lwjgl),52543c14469055c49327d3cbeb62dc7c615a966825bb9856c3c35e2560aebe77)

