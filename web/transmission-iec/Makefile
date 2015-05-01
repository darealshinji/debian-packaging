include ../../mk/include.mk

deps       = wget
bin        = transmission.txz
builddir   = transmission-2.84
distcleanfiles = $(bin)


download:
	@ $(call download,$(bin),https://transmission.cachefly.net/transmission-2.84.tar.xz)
	@ $(call verifysha256,$(bin),a9fc1936b4ee414acc732ada04e84339d6755cd0d097bcbd11ba2cfc540db9eb)
	tar xvf $(bin)

