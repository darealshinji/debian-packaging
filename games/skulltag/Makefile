include ../../mk/include.mk

deps           = wget
bin            = st-v098d_linux-x86$(X64)
fmod           = fmodapi42416linux$(FMOD_64)
srcfiles       = changelog.txt $(bin).tbz $(fmod).tgz patchelfmod.tar.gz
cleanfiles     = *.txt
distcleanfiles = *.tbz *.tgz

sha256sum      = 8c87d56fa9ffe9557b67c544fd5e320d1db6c122497ff2100d6f330fab699c2d
sha256sum_fmod = a516e48c0c715c31efdc0c810f26188c2bb484615e7a5e53ca936ad1d5e0b18d
ifeq ($(ARCH),amd64)
sha256sum      = 6749f9c2c1e87e59a5546f91fa873b54595a1d387fa632d5f4d2f916800e6de2
sha256sum_fmod = de545ab90c4f137a8e1734ed1891c7e28fa257d9cb7e6c953bedfd0fd9a77c42
X64            = _64
FMOD_64        = 64
endif

download:
	wget -O changelog.txt "http://skulltag.com/download/files/release/Skulltag%20Version%20History.txt"
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	test -f $(bin).tbz  || wget -O $(bin).tbz  "http://www.skulltag.com/download/files/release/$(bin).tar.bz2"
	test -f $(fmod).tgz || wget -O $(fmod).tgz "http://zandronum.com/essentials/fmod/$(fmod).tar.gz"
	@$(call verifysha256,$(bin).tbz,$(sha256sum))
	@$(call verifysha256_fmod,$(fmod).tgz,$(sha256sum))
