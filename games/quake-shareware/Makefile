include ../../mk/include.mk

deps           = wget
bin            = quake106.zip
srcfiles       = $(bin) *.svg ../../mk/make-icons.sh
distcleanfiles = $(bin) *.svg

svg_url = https://gist.githubusercontent.com/darealshinji/5d58ae11b03f8b023536/raw/25b376bd87b78aac6901369441bb24b2856086a8/quake.svg
#svg_url = https://raw.githubusercontent.com/linuxmint/mint-x-icons/master/usr/share/icons/Mint-X/apps/96/quake.svg

download:
	@ $(call download,$(bin),http://www.moddb.com/downloads/mirror/14692/113/c21ab0711bc10c02d41422e9e0b2ef56)
	@ $(call download,quake-shareware.svg,$(svg_url))
	@ $(call verifysha256,$(bin),ec6c9d34b1ae0252ac0066045b6611a7919c2a0d78a3a66d9387a8f597553239)

