include ../../mk/include.mk

ARCH       = i386
deps       = wget
srcfiles   = $(bin) animechecker.svg patchelfmod.tgz
cleanfiles = $(srcfiles)
VERSION    = $(shell head -n1 debian/changelog | cut -d' ' -f2 | head -c-2 | tail -c+2)
bin        = animechecker-$(VERSION)-linux-i386-bin.tar.bz2

download:
	wget -O $(bin) "http://downloads.sourceforge.net/project/animechecker/animechecker-linux/$(VERSION)/$(bin)?r=&ts=1419155524"
	@$(call verifysha256,$(bin),208b4485f7776db27109f974b064fc7ff9abdeb5676187a1206fb94e561bb11a)
	wget -O patchelfmod.tgz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	wget -O animechecker.svg "https://upload.wikimedia.org/wikipedia/commons/d/da/Wikipe-tan_face.svg"
