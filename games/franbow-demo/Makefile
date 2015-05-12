include ../../mk/include.mk

deps           = wget
bin            = franbow-demo.tgz
srcfiles       = $(bin)
distcleanfiles = $(bin)

download:
	@ $(call download,$(bin),https://www.dropbox.com/s/6x4qdvxyadryn4x/Fran%20Bow%20Demo.tar.gz?dl=1)
	@ $(call verifysha256,$(bin),392bb80a823f0e5a9d6a96f2d68c3e2344e14cfd40f51b5f811c46310a7c9bac)

