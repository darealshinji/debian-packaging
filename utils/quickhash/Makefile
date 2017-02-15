include ../../mk/include.mk

deps           = wget
bin            = quickhash.tgz
srcfiles       = $(bin) *.ico ../../mk/make-icons.sh
cleanfiles     = *.ico
distcleanfiles = $(bin)

VER = 2.7.0
ID  = 208
sha256sum = baac67548f652126227a1c01c58f37934a94f4256aa67b3a48c9d25796d02c15


download:
	@ $(call download,$(bin),http://quickhash-gui.org/download/?wpdmdl=$(ID))
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/4b2439a398046d4262537a7c2985b657fda3c90f/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER); $(changelog-entry)

