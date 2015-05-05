include ../../mk/include.mk

deps       = wget
bin        = utserver.tar.gz
png        = utorrent.png
srcfiles   = $(png) $(bin)
cleanfiles = $(png)

VERSION       = 3.3
changelog-msg = Initial release

DLARCH   = i386
checksum = ec8bbe21eb3fab14f725c0d3ea648b61d035bf8a2871bb006abd3405f99ed067
ifeq ($(ARCH), amd64)
DLARCH   = x64
checksum = 6e4f836d5ca6bc5ec48632b4e425a936d1a09ab38a6ed2ab8d7016dd8e2b81bf
endif

download:
	@ $(call download,$(bin),http://download-new.utorrent.com/endpoint/utserver/os/linux-$(DLARCH)-ubuntu-13-04/track/beta)
	@ $(call download,$(png),http://www.utorrent.com/img/banners/utSmartBanner.png)
	@ $(call verifysha256,$(bin),$(checksum))
	@ VERSION=$(VERSION); $(changelog-entry)
