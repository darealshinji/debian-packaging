include ../../mk/include.mk

deps           = wget
bin            = franbow-demo.zip
srcfiles       = $(bin) ../../mk/make-icons.sh
distcleanfiles = $(bin)

download:
	@ $(call download,$(bin),http://www.indiedb.com/downloads/mirror/88856/110/9ebacccdfcd2cea11705d9cc2f3b5594)
	@ $(call verifysha256,$(bin),91db7b44fba7f3c23ce430a0704a72992d12653ce34074820e03d1c8cc3f047a)

