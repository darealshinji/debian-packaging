include ../../mk/include.mk

deps           = wget
builddir       = renpy-$(VERSION)-sdk
bin            = renpy-sdk.tbz
patchelfmod    = patchelfmod.tgz
distcleanfiles = $(bin) $(patchelfmod)

URL = http://www.renpy.org
VERSION = $(shell wget -q -O - $(URL)/latest.html | grep 'Download SDK <span>zip' | cut -d '"' -f2 | sed 's@$(URL)/dl/@@' | cut -d '/' -f1)


download:
	@ $(call download,$(bin),$(URL)/dl/$(VERSION)/renpy-$(VERSION)-sdk.tar.bz2)
	@ $(call download,$(patchelfmod),https://github.com/darealshinji/patchelfmod/archive/master.tar.gz)
	tar xvf $(bin)
	cp $(patchelfmod) $(builddir)
	@ VERSION=$(VERSION); $(changelog-entry)

	cd $(builddir) && \
		rm -rf renpy.app renpy.exe module/gen lib/pythonlib* lib/darwin* lib/windows*
	find $(builddir) -name "*.pyc" -delete
	find $(builddir) -name "*.rpyc" -delete
	find $(builddir) -name "*.rpymc" -delete
	find $(builddir) -name "*.pyo" -delete
ifeq ($(ARCH), amd64)
	rm -rf $(builddir)/lib/linux-i686
else
	rm -rf $(builddir)/lib/linux-x86_64
endif
	cd $(builddir) && tar cvfJ lib.tar.xz lib && rm -rf lib

