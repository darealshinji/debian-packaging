include ../../mk/include.mk

deps          = wget dh-autoreconf
builddir      = MediaInfo_GUI_GNU_FromSource
srcfiles      = ../../mk/make-icons.sh
changelog-msg = New upstream release

URL = $(shell wget -q -O - "http://mediaarea.net/MediaInfo/Download/Source" | \
	grep -e 'mediaarea\.net/download/binary/mediainfo-gui/' | cut -d '"' -f2 | sed 's|.*mediaarea\.net|http://mediaarea.net|')
VER = $(shell echo $(URL) | cut -d '/' -f7)


download:
	@ $(call download,MediaInfo.tar.bz2,$(URL))
	tar xvf MediaInfo.tar.bz2
	@ VERSION=$(VER)+1; $(changelog-entry)

