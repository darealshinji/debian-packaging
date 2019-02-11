include ../../mk/include.mk

deps          = wget
bin           = onedrive.zip
srcfiles      = $(bin)
cleanfiles    = $(bin)
changelog-msg = New upstream release

download:
	@ $(call download,$(bin),http://jp-andre.pagesperso-orange.fr/$(bin))
	@ VERSION=1.1.0; $(changelog-entry)

