include ../../mk/include.mk

deps           = wget
bin            = XnRetro-linux.tgz
srcfiles       = $(bin)
distcleanfiles = $(bin)

#changelog-msg = Initial release
#VERSION       = $(shell wget -q -O - http://www.xnview.com/en/xnretro/ | grep -e 'Download <strong>XnRetro' | \
#		perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)

download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))

