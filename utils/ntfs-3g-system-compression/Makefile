include ../../mk/include.mk

deps          = wget
bin           = systcomp.zip
srcfiles      = $(bin)
cleanfiles    = $(bin)
changelog-msg = New upstream release

download:
	@ $(call download,$(bin),http://jp-andre.pagesperso-orange.fr/$(bin))
	@ VERSION=0.2; $(changelog-entry)

