include ../../mk/include.mk

deps           = wget
bin            = battlejump.tgz
srcfiles       = $(bin)
distcleanfiles = $(bin)

dl_arch   = x86
sha256sum = 3b5964e076ff72db3812e57f2743e1f05043c3c2a91102ab2e6d8c26bd93cbee
ifeq ($(ARCH),amd64)
dl_arch   = x64
sha256sum = 743048f3d430767e1797cc1802e499fc36cdb093ac5dd1dfeee9a3e446e4455d
endif


download:
	@ $(call download,$(bin),http://www.battlejump.com/Download/Battle_Jump_v0120_Linux_$(dl_arch).tar.gz)
	@ $(call verifysha256,$(bin),$(sha256sum))

