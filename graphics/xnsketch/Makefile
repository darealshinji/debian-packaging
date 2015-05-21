include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin)
distcleanfiles = $(bin)
bin            = XnSketch-linux.tgz

#changelog-msg = Initial release
#VERSION       = $(shell wget -q -O - http://www.xnview.com/en/xnsketch/ | grep -e 'Download <strong>XnSketch' | \
#		perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)


download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))

