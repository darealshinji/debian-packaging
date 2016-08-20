include ../../mk/include.mk

deps       = wget
bin        = behand.tar.gz
srcfiles   = $(bin)

download:
	@ $(call download,$(bin),http://www.zevenos.com/wp-content/uploads/2009/11/$(bin))
	@ $(call verifysha256,$(bin),65520be26224448d7fab6b7dd282197ec9daab0a281532f068e3096294f1ffa4)
	@ VERSION=0.1; $(changelog-entry)

