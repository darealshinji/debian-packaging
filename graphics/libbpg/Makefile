include ../../mk/include.mk

deps     = wget
bpg-ver  = $(shell dpkg-parsechangelog -SVersion)
png-ver  = 1.6.18
bpg-bin  = libbpg-$(bpg-ver).tar.gz
png-bin  = libpng-$(png-ver).tar.xz
builddir = libbpg-$(bpg-ver)

download:
	@ $(call download,$(bpg-bin),http://bellard.org/bpg/$(bpg-bin))
	@ $(call download,$(png-bin),http://downloads.sourceforge.net/project/libpng/libpng16/$(png-ver)/$(png-bin)?r)
	@ $(call verifysha256,$(bpg-bin),2800777d88a77fd64a4a9036b131f021a5bda8304e1dbe7996dd466567fb484e)
	@ $(call verifysha256,$(png-bin),2e10c13b7949883ac961db6177c516d778184432d440317e9f0391305c360963)
	tar xvf $(bpg-bin)
	tar xvf $(png-bin)
	mv libpng-$(png-ver) $(builddir)/libpng16

