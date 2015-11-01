include ../../mk/include.mk

QTARCH    = x86
BITS      = 32
# https://gist.github.com/darealshinji/6e8a58b1d95e141d6a28
gistid    = 6e8a58b1d95e141d6a28
mysql_sum = cf9406887a41293a0da7ee0f67f0b6c9a26b86308c3d3bed9c10bc525fc70a0a
ifeq ($(ARCH), amd64)
GCCARCH   = _64
QTARCH    = x64
BITS      = 64
# https://gist.github.com/darealshinji/a366574234de27487a5c
gistid    = a366574234de27487a5c
mysql_sum = fef2726e7004a43a4e066c0575bb78a7adf1f1f7bf3a200399bf09a3c79e3300
endif

QTVER1         = 5.5
QTVER2         = $(shell echo $(QTVER1) | tr -d .)
QTPOINTVER     = 5.5.1
QTREV          = 0qt5
ICUREV         = 0icu-linux-g++-Rhel6.6-$(QTARCH)

changelog-msg  = Initial release
URL            = http://download.qt.io/online/qtsdkrepository/linux_$(QTARCH)/desktop/qt5_$(QTVER2)/qt.$(QTVER2).gcc$(GCCARCH)
addons         = $(QTPOINTVER)-$(QTREV)_addons.7z
essentials     = $(QTPOINTVER)-$(QTREV)_essentials.7z
icu            = $(QTPOINTVER)-$(ICUREV).7z
addons_sum     = $(shell wget -q -O - "$(URL)/$(addons).sha256" | cut -d' ' -f1)
essentials_sum = $(shell wget -q -O - "$(URL)/$(essentials).sha256" | cut -d' ' -f1)
icu_sum        = $(shell wget -q -O - "$(URL)/$(icu).sha256" | cut -d' ' -f1)

mysql_base64   = https://gist.github.com/darealshinji/$(gistid)/raw/libmysqlclient16-$(ARCH).tar.xz.base64
mysql          = libmysqlclient16.txz

deps           = wget
srcfiles       = addons.7z icu.7z essentials.7z $(mysql)
cleanfiles     = $(mysql) debian/control
distcleanfiles = *.7z


download:
	sed -e 's/@VERSION@/$(QTVER1)/g' debian/control.in > debian/control
	@ $(call download,addons.7z,$(URL)/$(addons))
	@ $(call download,icu.7z,$(URL)/$(icu))
	@ $(call download,essentials.7z,$(URL)/$(essentials))
	rm -f $(mysql) && wget -O - $(mysql_base64) | base64 -d - > $(mysql)
	@ $(call verifysha256,addons.7z,$(addons_sum))
	@ $(call verifysha256,icu.7z,$(icu_sum))
	@ $(call verifysha256,essentials.7z,$(essentials_sum))
	@ $(call verifysha256,$(mysql),$(mysql_sum))
	@ VERSION=$(QTPOINTVER); $(changelog-entry)

