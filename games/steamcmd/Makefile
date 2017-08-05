include ../../mk/include.mk

deps          = wget
bin           = steamcmd_linux.tar.gz
cleanfiles    = $(bin)
srcfiles      = $(bin)
changelog-msg = Current release version

download:
	@ $(call download,$(bin),https://steamcdn-a.akamaihd.net/client/installer/$(bin))
	@ VERSION=`stat steamcmd_linux.tar.gz | grep Modify | cut -d' ' -f2 | tr -d -`; \
	$(changelog-entry)
