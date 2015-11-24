include ../../mk/include.mk

deps          = wget
bin           = ts_126410v120000p0.zip
srcfiles      = $(bin)
cleanfiles    = $(bin)
VERSION       = 12.0.0
changelog-msg = Initial release


download:
	@ $(call download,$(bin),http://www.etsi.org/deliver/etsi_ts/126400_126499/126410/12.00.00_60/$(bin))
	@ $(call verifysha256,$(bin),e18e70a303b595a00af5453ec30df6964fdc17bbb7a0ba66111dde6f74482b2d)
	@ VERSION=$(VERSION); $(changelog-entry)

