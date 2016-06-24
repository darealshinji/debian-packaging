include ../../mk/include.mk

deps           = wget
bin            = quickhash.zip
srcfiles       = $(bin) *.ico ../../mk/make-icons.sh
cleanfiles     = *.ico
distcleanfiles = $(bin)

VER = 2.6.8
URL = https://sourceforge.net/projects/quickhash/files/v$(VER)/Linux/QuickHash-Linux-v$(VER).zip/download

sha256sum = 937422500cf5a60707be5ae3ae0bf00eed156ef04649dec2002d92acbe30655c


download:
	@ $(call download,$(bin),$(URL))
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/4b2439a398046d4262537a7c2985b657fda3c90f/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER); $(changelog-entry)

