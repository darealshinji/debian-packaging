include ../../mk/include.mk

ARCH          = i386
deps          = wget
bin           = steamcmd_linux.tar.gz
cleanfiles    = $(bin)
srcfiles      = $(bin)
changelog-msg = Current release version

download:
	@ $(call download,$(bin)http://media.steampowered.com/installer/$(bin))
	@ VERSION=`stat steamcmd_linux.tar.gz | grep Modify | cut -d' ' -f2 | tr -d -`; \
	$(changelog-entry)
