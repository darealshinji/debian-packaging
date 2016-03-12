include ../../mk/include.mk

deps           = wget
bin            = SpaghettiArmageddon.txz
srcfiles       = $(bin)
distcleanfiles = $(bin)

download:
	@ $(call download,$(bin),https://drive.google.com/uc?export=download&id=0BxClEVSW8QykQkg5d245NjJDUlk)
	@ $(call verifysha256,$(bin),2190fdd5f744ca5ca55d747d99b13354085b434447576878b2b52b7f35d0ce41)

