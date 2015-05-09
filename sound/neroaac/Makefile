include ../../mk/include.mk

deps       = wget unzip
bin        = NeroAACCodec-1.5.1.zip
srcfiles   = neroaac
cleanfiles = $(srcfiles) $(bin)

VERSION       = 1.5.4.0
changelog-msg = Initial release

download:
	@ $(call download,$(bin),ftp://ftp6.nero.com/tools/$(bin))
	@ $(call verifysha256,$(bin),e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b)
	unzip $(bin) -d neroaac
	@ VERSION=$(VERSION); $(changelog-entry)

