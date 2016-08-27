include ../../mk/include.mk

deps           = wget
bin            = quickhash.zip
srcfiles       = $(bin) *.ico ../../mk/make-icons.sh
cleanfiles     = *.ico
distcleanfiles = $(bin)

VER = 2.6.9
REL = .2
URL = https://sourceforge.net/projects/quickhash/files/v$(VER)/Linux/QuickHash-v$(VER)$(REL)-Linux.zip/download

sha256sum = 7c63e7707fc889481b17ebf96f2f65e926f5e5a3b86f96d5dbd48a99aff94609


download:
	@ $(call download,$(bin),$(URL))
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/4b2439a398046d4262537a7c2985b657fda3c90f/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER); $(changelog-entry)

