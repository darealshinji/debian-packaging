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
	@$(call verifysha256,$(bpg-bin),9986d66408f36fb678014bfcbb693c0f8358767719bc05797e4af54fa4237c2a)
	@$(call verifysha256,$(png-bin),42f754df633e4e700544e5913cbe2fd4928bbfccdc07708a5cf84e59827fbe60)
	tar xvf $(bpg-bin)
	tar xvf $(png-bin)
	mv libpng-$(png-ver) libbpg-$(bpg-ver)/png

