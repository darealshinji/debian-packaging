include ../../mk/include.mk

deps          = wget
bin           = steam-deb
cleanfiles    = $(bin)
srcfiles      = $(bin)
changelog-msg = Latest upstream release

download:
	@ $(call download,$(bin),http://media.steampowered.com/client/installer/steam.deb)
	@ VERSION=1:`dpkg-deb -I $(bin) | grep Version: | sed 's/ Version: //'` ; \
	$(changelog-entry)

