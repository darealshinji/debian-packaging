include ../../mk/include.mk

ARCH           = i386
deps           = wget
bin            = SpaghettiArmageddon_Linux.tar.gz
distcleanfiles = $(bin)
srcfiles       = $(bin)

download:
	@ $(call download,$(bin),http://tinyurl.com/k5a7a2x)
	@ $(call verifysha256,$(bin),35c56e780476f7ca5d5b5344b3301e50f680cfd265ef9ceccb0b84f5fff5b4af)

