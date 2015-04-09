include ../../mk/include.mk

ARCH           = i386
deps           = wget
bin            = SpaghettiArmageddon_Linux.tgz
sfml           = SFML-1.6
srcfiles       = $(bin) $(sfml)
cleanfiles     = $(sfml)
distcleanfiles = $(bin) $(sfml).tgz

download:
	@ $(call download,$(bin),http://tinyurl.com/k5a7a2x)
	@ $(call download,$(sfml).tgz,https://github.com/darealshinji/$(sfml)/archive/small.tar.gz)
	@ $(call verifysha256,$(bin),35c56e780476f7ca5d5b5344b3301e50f680cfd265ef9ceccb0b84f5fff5b4af)
	tar xvf $(sfml).tgz
	mv $(sfml)-small $(sfml)

