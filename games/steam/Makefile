include ../../mk/include.mk

ARCH          = i386
deps          = wget
cleanfiles    = steam.deb
srcfiles      = steam.deb
changelog-msg = Latest upstream release

download:
	wget "http://media.steampowered.com/client/installer/steam.deb"
	VERSION=1:`dpkg-deb -I steam.deb | grep Version: | sed 's/ Version: //'` ; \
	$(changelog-entry)

