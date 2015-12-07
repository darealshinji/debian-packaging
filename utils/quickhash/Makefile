include ../../mk/include.mk

deps       = wget
bin        = QuickHash.tar.gz
srcfiles   = $(bin) quickhash.ico
cleanfiles = *.ico

VER       = 2.6.4
PATCH     = .a
URL       = http://downloads.sourceforge.net/project/quickhash/v$(VER)-Linux/QuickHash-Linux-v$(VER)$(PATCH).tar.gz?r
sha256sum = 9b2e1d36a60f3831da377a89a7865383d3ee896d68703dc7991dcb9086108186


download:
	@ $(call download,$(bin),$(URL))
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/master/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER)$(PATCH); $(changelog-entry)

