include ../../mk/include.mk

deps       = wget
bin        = QuickHash.tar.gz
srcfiles   = $(bin) quickhash.ico ../../mk/make-icons.sh
cleanfiles = *.ico

VER       = 2.6.5
URL       = http://downloads.sourceforge.net/project/quickhash/v$(VER)/QuickHash-Linux-v$(VER).tar.gz?r
sha256sum = dc893e195eb7fadc62391b8a1704b5e21b04c9709f292643ea1921a10003711f


download:
	@ $(call download,$(bin),$(URL))
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/master/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER)$(PATCH); $(changelog-entry)

