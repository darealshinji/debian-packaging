include ../../mk/include.mk

deps           = git
ngdir          = nightingale-hacking
srcfiles       = $(ngdir)/* $(ngdeps).txz $(jpeg).txz
cleanfiles     = minimizetotrayplus nightingale-deps
distcleanfiles = $(ngdir) *.txz
changelog-file = $(ngdir)/changelog.new

ngdeps = linux-$(ngarch)-release
jpeg = libjpeg8-$(ngarch)
URL = https://github.com/darealshinji/nightingale-deps/releases/download/20151012

ifeq ($(ARCH),amd64)
ngarch = x86_64
sha256sum = 13a8f64d9acac07d28463d2411ac34cb1ce66d1fdf85ea9e47d1d2b21277a561
sha256sum_jpeg = fd89d3266ea85a70515532ee88f42152ba397e91f8e333d5e5582a2d8a2b3c25
else
ngarch = i686
sha256sum = 4bf111fd16ac505763b98fc58268af1555037ba657f0bd0c5d81b7ee6f03fca9
sha256sum_jpeg = 6aa5ccc46c08841bab052f400ea71033d923516fc568ab6ca186aee0cdc38ea0
endif

download:
	test -d $(ngdir) || ./download.sh
	@ $(call download,$(ngdeps).txz,$(URL)/$(ngdeps).tar.xz)
	@ $(call download,$(jpeg).txz,$(URL)/$(jpeg).tar.xz)
	@ $(call verifysha256,$(ngdeps).txz,$(sha256sum))
	@ $(call verifysha256,$(jpeg).txz,$(sha256sum_jpeg))
	@ VERSION="$$(cat $(ngdir)/VERSION)-1"; $(changelog-entry)
	mkdir -p $(ngdir)/debian
	cat $(ngdir)/changelog.new $(ngdir)/changelog.in > $(ngdir)/debian/changelog

