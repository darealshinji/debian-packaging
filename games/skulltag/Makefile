include ../../mk/include.mk

deps           = wget
bin            = st-v098d_linux-x86$(X64)
fmod           = fmodapi42416linux$(FMOD_64)
jpegdeb        = libjpeg62_6b-15ubuntu1.1_$(ARCH).deb
srcfiles       = changelog.txt $(bin).tbz $(fmod).tgz patchelfmod.tar.gz $(jpegdeb)
cleanfiles     = *.txt
distcleanfiles = *.tbz *.tgz

sha256sum      = 8c87d56fa9ffe9557b67c544fd5e320d1db6c122497ff2100d6f330fab699c2d
sha256sum_fmod = a516e48c0c715c31efdc0c810f26188c2bb484615e7a5e53ca936ad1d5e0b18d
sha256sum_deb  = 06eb6bbe6504af77ca62fdbe35de591c8fa89dfffaaa659a5b048ef2bf3f5c1d
ifeq ($(ARCH),amd64)
sha256sum      = 6749f9c2c1e87e59a5546f91fa873b54595a1d387fa632d5f4d2f916800e6de2
sha256sum_fmod = de545ab90c4f137a8e1734ed1891c7e28fa257d9cb7e6c953bedfd0fd9a77c42
sha256sum_deb  = 7ace1d6cb19b829d0973ace7553510877841cb9c2770e2742084447c5cba6ff7
X64            = _64
FMOD_64        = 64
endif

download:
	wget -O changelog.txt "http://skulltag.com/download/files/release/Skulltag%20Version%20History.txt"
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	wget "http://security.ubuntu.com/ubuntu/pool/main/libj/libjpeg6b/$(jpegdeb)"
	test -f $(bin).tbz  || wget -O $(bin).tbz  "http://www.skulltag.com/download/files/release/$(bin).tar.bz2"
	test -f $(fmod).tgz || wget -O $(fmod).tgz "http://zandronum.com/essentials/fmod/$(fmod).tar.gz"
	@$(call verifysha256,$(bin).tbz,$(sha256sum))
	@$(call verifysha256,$(fmod).tgz,$(sha256sum_fmod))
	@$(call verifysha256,$(jpegdeb),$(sha256sum_deb))
