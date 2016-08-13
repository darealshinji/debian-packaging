include ../../mk/include.mk

deps       = wget
bin        = Haiku-Icons.tar.gz
srcfiles   = $(bin)

download:
	@ $(call download,$(bin),http://www.zevenos.com/wp-content/uploads/2009/11/$(bin))
	@ $(call verifysha256,$(bin),9a24abfa1c28ead1f8b70df8bcfc80443dcc058568d1a15eba50b3e6aed5d61e)
	@ VERSION=0.1; $(changelog-entry)

