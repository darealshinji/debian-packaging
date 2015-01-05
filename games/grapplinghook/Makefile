include ../../mk/include.mk

VERSION   = $(shell dpkg-parsechangelog -SVersion)

deps      = wget
bin       = GrapplingHook.tar.gz
bin_demo  = GrapplingHook_Demo.tar.gz
lwjgl     = lwjgl-2.9.1.zip

srcfiles  = $(lwjgl) ghook.png
ifeq ($(COMMON_PKG),1)
srcfiles += common-package.stamp
endif

cleanfiles     = $(lwjgl) ghook.png common-package.stamp
allcleanfiles  = $(LOG) *.dsc $(builddir) $(cleanfiles) grapplinghook_$(VERSION).tar.gz
distcleanfiles = $(bin) $(bin_demo)


download: ghook
	wget -O $(lwjgl) 'http://downloads.sourceforge.net/project/java-game-lib/Official%20Releases/LWJGL%202.9.1/$(lwjgl)?r=&ts=1419016399'
	wget -O ghook.png "http://fs1.directupload.net/images/141216/kvgj7f7q.png"
	@$(call verifysha256,$(lwjgl),52543c14469055c49327d3cbeb62dc7c615a966825bb9856c3c35e2560aebe77)
	touch common-package.stamp

ifeq ($(wildcard $(bin)),$(bin))
srcfiles += $(bin)
ghook: ghook_full
else
srcfiles += $(bin_demo)
ghook: ghook_demo
endif

ghook_full:
	@echo "Full version found."
	@echo ""
	@$(call verifysha256,$(bin),0ae76375303578ea458ea626cbcd703e84871991696e9503b17c5c752062dc4f)

ghook_demo:
	@echo "Download demo version."
	@echo ""
	test -f $(bin_demo) || wget "http://ghook.speedrungames.com/download/$(bin_demo)"
	@$(call verifysha256,$(bin_demo),b1970af780ce6023f12b0689ec35bae4e4a806868ac9b48ad94e73a3452665bb)
	tar xvf $(bin_demo)
	mv GrapplingHook_Demo GrapplingHook
	rm $(bin_demo)
	tar cfz $(bin_demo) GrapplingHook
	rm -r GrapplingHook

