include ../../mk/include.mk

deps          = wget
bpg-ver       = 0.9.7
png-ver       = 1.6.26
bpg-bin       = libbpg-$(bpg-ver).tar.gz
png-bin       = libpng-$(png-ver).tar.xz
builddir      = libbpg-$(bpg-ver)
changelog-msg = New upstream release

sha256_bpg = 05035862ff4ffca0280261871486f44e74c4af4337c931e0858483551e6efe25
sha256_png = 266743a326986c3dbcee9d89b640595f6b16a293fd02b37d8c91348d317b73f9

download:
	@ $(call download,$(bpg-bin),http://bellard.org/bpg/$(bpg-bin))
	@ $(call download,$(png-bin),https://sourceforge.net/projects/libpng/files/libpng16/$(png-ver)/$(png-bin))
	@ $(call verifysha256,$(bpg-bin),$(sha256_bpg))
	@ $(call verifysha256,$(png-bin),$(sha256_png))
	tar xvf $(bpg-bin)
	tar xvf $(png-bin)
	mv libpng-$(png-ver) $(builddir)/libpng16
	@ VERSION=$(bpg-ver); $(changelog-entry)

