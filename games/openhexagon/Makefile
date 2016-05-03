include ../../mk/include.mk

ARCH = amd64

deps           = wget
bin            = OpenHexagon.txz
srcfiles       = $(bin)
distcleanfiles = $(bin)

download:
	@ $(call download,$(bin),https://drive.google.com/uc?export=download&id=0BxClEVSW8QykQ2lCdFlnMEZnNm8)
	@ $(call verifysha256,$(bin),84fa8ae29d43201ef6881b6f7fe1b1424fd221f591489ddc7d71eed55c0e03e5)

