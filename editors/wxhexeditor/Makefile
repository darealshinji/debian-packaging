include ../../mk/include.mk

ARCH=amd64

deps          = wget
bin           = wxHexEditor.tbz
cleanfiles    = $(bin)
srcfiles      = $(bin) files ../../mk/make-icons.sh
changelog-msg = Current release version

#version = $(wget -q -O - http://wxhexeditor.sourceforge.net/version.php)
version   = 0.23
URL       = http://downloads.sourceforge.net/project/wxhexeditor/wxHexEditor/v0.23%20Beta/wxHexEditor-v0.23-Linux_x86_64.tar.bz2?r
sha256sum = be85a912fe6fe18683a96ab7573a4344348f590a195441c22fc58335dfaf8963

download:
	@ $(call download,$(bin),$(URL))
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(version); $(changelog-entry)

