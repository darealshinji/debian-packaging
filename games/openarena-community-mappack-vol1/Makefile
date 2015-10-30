include ../../mk/include.mk

deps           = wget
bin            = oacmp-volume1-v3.zip
distcleanfiles = $(bin)
srcfiles       = $(bin)

download:
	@ $(call download,$(bin),http://download.tuxfamily.org/openarena/upload/$(bin))
	@ $(call verifysha256,$(bin),7b735cdf0fcd63da981c27d811b0f915a992842d1ba84c47ef8de56a6e67e41b)

