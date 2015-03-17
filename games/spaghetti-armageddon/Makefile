include ../../mk/include.mk

ARCH           = i386
deps           = wget
bin            = SpaghettiArmageddon_Linux.tgz
sfml           = SFML-1.6-sdk-linux-32
srcfiles       = $(bin) SFML-1.6
cleanfiles     = SFML-1.6
distcleanfiles = $(bin) $(sfml).tgz

download:
	@ $(call download,$(bin),http://tinyurl.com/k5a7a2x)
	@ $(call download,$(sfml).tgz,http://www.sfml-dev.org/files/$(sfml).tar.gz)
	@ $(call verifysha256,$(bin),35c56e780476f7ca5d5b5344b3301e50f680cfd265ef9ceccb0b84f5fff5b4af)
	@ $(call verifysha256,$(sfml).tgz,b1c18f9b99c54ebb4cd433792f33ed2b85c846cca28eb871a12b3191dc1532f8)
	tar xvf $(sfml).tgz
	cd SFML-1.6 && rm -rf doc lib samples/bin && make clean

