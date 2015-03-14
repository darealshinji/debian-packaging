include ../../mk/include.mk

deps           = wget git
builddir       = zdoom
cleanfiles     = fmodapi*linux debian/changelog
distcleanfiles = *.tgz
srcfiles       = fmodapi444*linux.tgz

download:
	test -d $(builddir) || ./download.sh
	rm -rf $(builddir)/.git

