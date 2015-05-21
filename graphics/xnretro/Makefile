include ../../mk/include.mk

deps           = wget
bin            = XnRetro-linux.tgz
srcfiles       = $(bin) *.png
distcleanfiles = $(bin) *.png

#changelog-msg = Initial release
#VERSION       = $(shell wget -q -O - http://www.xnview.com/en/xnretro/ | grep -e 'Download <strong>XnRetro' | \
#		perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)

download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))
	@ $(call download,xnretro.png,http://www.xnview.com/assets/img/app-retro-512.png)

