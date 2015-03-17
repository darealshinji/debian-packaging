include ../../mk/include.mk

deps           = wget dh-autoreconf
builddir       = MediaInfo_CLI_GNU_FromSource
changelog-msg  = New upstream release

URL = $(shell wget -q -O - "http://mediaarea.net/MediaInfo/Download/Source" | \
	grep -e 'mediaarea.net/download/binary/mediainfo/' | cut -d '"' -f2)
VER = $(shell echo $(URL) | cut -d '/' -f7)


download:
	@ $(call download,MediaInfo.tar.bz2,$(URL))
	tar xvf MediaInfo.tar.bz2
	VERSION=$(VER) ; $(changelog-entry)

