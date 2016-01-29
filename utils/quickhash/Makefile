include ../../mk/include.mk

deps       = wget
bin        = quickhash
srcfiles   = $(bin) *.ico *.pdf ChangeLog ../../mk/make-icons.sh
cleanfiles = $(bin) *.ico *.pdf ChangeLog

VER = 2.6.6
URL = https://downloads.sourceforge.net/project/quickhash/v$(VER)/Linux

ifeq ($(ARCH), amd64)
BITS = 64
sha256sum = 9c13f3469f4f859e45ef6c6b60a87690c248547698764575c41a013b891ad2da
else
BITS = 32
sha256sum = ffd1716e9341db8828cdacf802235aa58b7c7a249689665b50a0b8ef8e27e348
endif


download:
	@ $(call download,$(bin),$(URL)/Quickhash-v$(VER)-Linux-x$(BITS))
	@ $(call download,UserManual.pdf,$(URL)/UserManual.pdf)
	@ $(call download,ChangeLog,$(URL)/README.txt)
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/master/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER); $(changelog-entry)

