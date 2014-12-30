include ../../Makefile.inc

DEBARCH = i386
LINUX = linux_x86
BITS = 32
ifeq ($(shell uname -p), x86_64)
DEBARCH = amd64
GCCARCH = _64
LINUX = linux_x64
BITS = 64
endif

QTVER1 = $(shell dpkg-parsechangelog -SSource | sed 's/libqt//')
QTVER2 = $(shell echo $(QTVER1) | tr -d .)
QTPOINTVER = $(shell dpkg-parsechangelog -SVersion)
URL = http://download.qt.io/online/qtsdkrepository/$(LINUX)/desktop/qt5_$(QTVER2)/qt.$(QTVER2).gcc$(GCCARCH)

addons = $(QTPOINTVER)-1qt5_addons.7z
essentials = $(QTPOINTVER)-1qt5_essentials.7z
icu = $(QTPOINTVER)-1icu_53_1_ubuntu_11_10_$(BITS).7z
addons_sum = $(shell wget -q -O - "$(URL)/$(addons).sha256" | cut -d' ' -f1)
essentials_sum = $(shell wget -q -O - "$(URL)/$(essentials).sha256" | cut -d' ' -f1)
icu_sum = $(shell wget -q -O - "$(URL)/$(icu).sha256" | cut -d' ' -f1)


deps = wget
srcfiles = addons.7z icu.7z essentials.7z deb/
cleanfiles = deb/ addons.7z icu.7z debian/control
distcleanfiles = essentials.7z


download:
	sed -e 's/@VERSION@/$(QTVER1)/g' debian/control.in > debian/control
	mkdir -p deb/
	wget -O deb/libmysqlclient16.deb "http://archive.ubuntu.com/ubuntu/pool/main/m/mysql-dfsg-5.1/libmysqlclient16_5.1.73-0ubuntu0.10.04.1_$(DEBARCH).deb"
	wget -O addons.7z "$(URL)/$(addons)"
	wget -O icu.7z "$(URL)/$(icu)"
	[ -f essentials.7z ] || wget -O essentials.7z "$(URL)/$(essentials)"
	@$(call verifysha256,addons.7z,$(addons_sum))
	@$(call verifysha256,icu.7z,$(icu_sum))
	@$(call verifysha256,essentials.7z,$(essentials_sum))

