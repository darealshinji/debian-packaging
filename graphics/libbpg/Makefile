include ../../mk/include.mk

deps     = wget
bpg-ver  = $(shell dpkg-parsechangelog -SVersion)
png-ver  = 1.6.21
bpg-bin  = libbpg-$(bpg-ver).tar.gz
png-bin  = libpng-$(png-ver).tar.xz
builddir = libbpg-$(bpg-ver)

sha256_bpg = 2800777d88a77fd64a4a9036b131f021a5bda8304e1dbe7996dd466567fb484e
sha256_png = 6c8f1849eb9264219bf5d703601e5abe92a58651ecae927a03d1a1aa15ee2083

download:
	@ $(call download,$(bpg-bin),http://bellard.org/bpg/$(bpg-bin))
	@ $(call download,$(png-bin),http://downloads.sourceforge.net/project/libpng/libpng16/$(png-ver)/$(png-bin)?r)
	@ $(call verifysha256,$(bpg-bin),$(sha256_bpg))
	@ $(call verifysha256,$(png-bin),$(sha256_png))
	tar xvf $(bpg-bin)
	tar xvf $(png-bin)
	mv libpng-$(png-ver) $(builddir)/libpng16

