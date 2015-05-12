include ../../mk/include.mk

deps           = wget
bin            = SpaghettiArmageddon_Linux.tgz
lib            = SFML-1.6.txz
srcfiles       = $(bin) $(lib)
distcleanfiles = $(bin) $(lib)

download:
	@ $(call download,$(bin),http://tinyurl.com/k5a7a2x)
	@ $(call download,$(lib),https://github.com/darealshinji/SFML-1.6/releases/download/1.6/SFML-1.6-linux-x86.tar.xz)
	@ $(call verifysha256,$(bin),35c56e780476f7ca5d5b5344b3301e50f680cfd265ef9ceccb0b84f5fff5b4af)
	@ $(call verifysha256,$(lib),dbd0300cbaeaf2a699064b6c140e7faad112ebfbdb6fa188052aa2532d679cbf)

