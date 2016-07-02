include ../../mk/include.mk

deps           = wget
bin            = quickhash.zip
srcfiles       = $(bin) *.ico ../../mk/make-icons.sh
cleanfiles     = *.ico
distcleanfiles = $(bin)

VER = 2.6.9
URL = https://sourceforge.net/projects/quickhash/files/v$(VER)/Linux/QuickHash-Linux-v$(VER).zip/download

sha256sum = 9d047ec03d53fb078beb97eff3e57276e0b3c57e2d34d621abc4755ebb5b2285


download:
	@ $(call download,$(bin),$(URL))
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/4b2439a398046d4262537a7c2985b657fda3c90f/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER); $(changelog-entry)

