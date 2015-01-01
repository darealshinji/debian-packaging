include ../../include.mk

deps = wget
bin = opensnc-linux-0.1.4.tar.gz
srcfiles = $(bin)

download:
	[ -f $(bin) ] || \
	    wget -O $(bin) "http://downloads.sourceforge.net/project/opensnc/Open%20Sonic/0.1.4/$(bin)?ts=1420143879"
	@$(call verifysha256,$(bin),edaaeb028839aeeee29a20a1806c53b5035972ae406bf248fc4966872084bbee)

