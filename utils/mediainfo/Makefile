include ../../mk/include.mk

deps          = wget dh-autoreconf
builddir      = MediaInfo_CLI_GNU_FromSource
changelog-msg = New upstream release

URL = $(shell wget -q -O - "https://mediaarea.net/en/MediaInfo/Download/Source" | \
	grep -e 'mediaarea\.net/download/binary/mediainfo/' | cut -d '"' -f2 | sed 's|.*mediaarea\.net|http://mediaarea.net|')
VER = $(shell echo $(URL) | cut -d '/' -f7)


download:
	@ $(call download,MediaInfo.tar.xz,$(URL))
	tar xvf MediaInfo.tar.xz
	@ VERSION=$(VER)+1; $(changelog-entry)

