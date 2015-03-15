include ../../mk/include.mk

deps           = wget automake
builddir       = MediaInfo_CLI_GNU_FromSource
changelog-msg  = New upstream release

URL = $(shell wget -q -O - "http://mediaarea.net/MediaInfo/Download/Source" | \
	grep -e 'mediaarea.net/download/binary/mediainfo/' | cut -d '"' -f2)
VER = $(shell echo $(URL) | cut -d '/' -f7)


download:
	@ $(call download,MediaInfo.tar.bz2,$(URL))
	tar xvf MediaInfo.tar.bz2
	VERSION=$(VER) ; $(changelog-entry)
	autoreconf -if $(builddir)/MediaInfo/Project/GNU/CLI
	autoreconf -if $(builddir)/MediaInfoLib/Project/GNU/Library
	autoreconf -if $(builddir)/ZenLib/Project/GNU/Library

