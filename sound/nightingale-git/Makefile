include ../../mk/include.mk

deps           = git
ngdir          = nightingale-hacking
srcfiles       = $(ngdir)/* $(ngdeps).txz $(jpeg).txz
cleanfiles     = minimizetotrayplus nightingale-deps
distcleanfiles = $(ngdir) *.txz
changelog-file = $(ngdir)/changelog.new

ngdeps = linux-$(ngarch)-release
jpeg = linux-$(ngarch)_jpeg-png
URL = https://github.com/darealshinji/nightingale-deps/releases/download/20151012

ifeq ($(ARCH),amd64)
ngarch = x86_64
sha256sum = 55ed73700c88b5c8293820242bc28780707d83ac40a42873b6d5a9a2e739ddbd
sha256sum_jpeg = 62a3217e0051669efc0c6c89dda2a2ef15fb705efe29b3d95f7bf1f016b58b3b
else
ngarch = i686
sha256sum = fc39676a38a6cdbb2b2c5b7add7d921a0085b1df38dc518f984dc20e59e815d0
sha256sum_jpeg = edc63299d1daab81f9e9435be20791338a5ae69b2af43e8da1a4cf5759dda8a9
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

