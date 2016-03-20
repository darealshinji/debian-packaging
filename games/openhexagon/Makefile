include ../../mk/include.mk

ARCH = amd64

deps           = wget
bin            = OpenHexagon.txz
srcfiles       = $(bin)
distcleanfiles = $(bin)


download:
	@ $(call download,$(bin),https://drive.google.com/uc?export=download&id=0BxClEVSW8QykSGZQSlJFRkctaUE)
	@ $(call verifysha256,$(bin),4449ba991426a4dc5104a2a0e0356c6302d75f9d3f3d8ccb2321ca24fe702997)

