include ../../mk/include.mk

deps       = wget
bin        = quickhash.tgz
srcfiles   = $(bin) *.ico ../../mk/make-icons.sh
cleanfiles = $(bin) *.ico

VER = 2.6.7
URL = http://downloads.sourceforge.net/project/quickhash/v$(VER)/QuickHash-Linux-v$(VER).tar.gz

sha256sum = e332e6bcf4cff243da53311ac20b0ac8f7a5c9cf874f927882fbe187fb597a3c


download:
	@ $(call download,$(bin),$(URL))
	@ $(call download,quickhash.ico,https://github.com/tedsmith/quickhash/raw/4b2439a398046d4262537a7c2985b657fda3c90f/project1.ico)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VER); $(changelog-entry)

