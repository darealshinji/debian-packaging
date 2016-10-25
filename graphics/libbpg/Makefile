include ../../mk/include.mk

deps          = wget
bpg-ver       = 0.9.7
bpg-bin       = libbpg-$(bpg-ver).tar.gz
png-bin       = libpng-$(png-ver).tar.xz
builddir      = libbpg-$(bpg-ver)
changelog-msg = New upstream release

png-ver = $(shell wget -q -O- 'http://sourceforge.net/p/libpng/code/ref/master/tags/' | \
  sed -n 's,.*<a[^>]*>v\([0-9][^<]*\)<.*,\1,p' | \
  grep -v alpha | grep -v beta | grep -v rc | sort -V | tail -1)

sha256_bpg = 05035862ff4ffca0280261871486f44e74c4af4337c931e0858483551e6efe25


download:
	@ $(call download,$(bpg-bin),http://bellard.org/bpg/$(bpg-bin))
	@ $(call download,$(png-bin),https://sourceforge.net/projects/libpng/files/libpng16/$(png-ver)/$(png-bin))
	@ $(call verifysha256,$(bpg-bin),$(sha256_bpg))
	tar xvf $(bpg-bin)
	tar xvf $(png-bin)
	mv libpng-$(png-ver) $(builddir)/libpng16
	@ VERSION=$(bpg-ver); $(changelog-entry)

