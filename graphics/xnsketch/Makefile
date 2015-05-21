include ../../mk/include.mk

deps           = wget
bin            = XnSketch-linux.tgz
srcfiles       = $(bin) *.png
distcleanfiles = $(bin) *.png

#changelog-msg = Initial release
#VERSION       = $(shell wget -q -O - http://www.xnview.com/en/xnsketch/ | grep -e 'Download <strong>XnSketch' | \
#		perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)


download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))
	@ $(call download,xnsketch.png,http://www.xnview.com/assets/img/app-xnsketch-512.png)

