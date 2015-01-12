include ../../mk/include.mk

deps     = wget
bpg-ver  = $(shell dpkg-parsechangelog -SVersion)
png-ver  = 1.6.16
bpg-bin  = libbpg-$(bpg-ver).tar.gz
png-bin  = libpng-$(png-ver).tar.xz
builddir = libbpg-$(bpg-ver)

download:
	wget 'http://bellard.org/bpg/$(bpg-bin)'
	wget -O $(png-bin) 'http://downloads.sourceforge.net/project/libpng/libpng16/$(png-ver)/$(png-bin)?r=&ts=1420631501'
	wget 'https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2'
	@$(call verifysha256,$(bpg-bin),30de1d0099920e24b7c9aae4d4e6b62f446823f0a1d52eb195dfc25c662ee203)
	@$(call verifysha256,$(png-bin),42f754df633e4e700544e5913cbe2fd4928bbfccdc07708a5cf84e59827fbe60)
	tar xvf $(bpg-bin)
	tar xvf $(png-bin)
	tar xvf tip.tar.bz2
	mv libpng-$(png-ver) $(builddir)/png
	mv multicoreware-x265-* $(builddir)/x265

