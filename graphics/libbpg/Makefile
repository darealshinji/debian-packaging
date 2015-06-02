include ../../mk/include.mk

deps     = wget
bpg-ver  = $(shell dpkg-parsechangelog -SVersion)
png-ver  = 1.6.17
bpg-bin  = libbpg-$(bpg-ver).tar.gz
png-bin  = libpng-$(png-ver).tar.xz
x265-bin = x265.tar.bz2
builddir = libbpg-$(bpg-ver)

download:
	@ $(call download,$(bpg-bin),http://bellard.org/bpg/$(bpg-bin))
	@ $(call download,$(png-bin),http://downloads.sourceforge.net/project/libpng/libpng16/$(png-ver)/$(png-bin)?r=&ts=1433231117)
	@ $(call download,$(x265-bin),https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2)
	@ $(call verifysha256,$(bpg-bin),30de1d0099920e24b7c9aae4d4e6b62f446823f0a1d52eb195dfc25c662ee203)
	@ $(call verifysha256,$(png-bin),98507b55fbe5cd43c51981f2924e4671fd81fe35d52dc53357e20f2c77fa5dfd)
	tar xvf $(bpg-bin)
	tar xvf $(png-bin)
	tar xvf $(x265-bin)
	mv libpng-$(png-ver) $(builddir)/png
	mv multicoreware-x265-* $(builddir)/x265

