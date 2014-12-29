include ../../Makefile.inc

deps = bzr
builddir = inyokaedit
cleanfiles = $(builddir)

srcpkg = inyokaedit
changelog-name = $(builddir)/debian/changelog
changelog-file = $(changelog-name).new
changelog-msg = Current trunk version
MAINTAINER = Thorsten Roth <elthoro@gmx.de>
VERSION = `cd $(builddir) && dpkg-parsechangelog -SVersion | cut -d- -f1`
REV = `cd $(builddir) && bzr version-info | grep revno | cut -d' ' -f2`

download:
	bzr branch lp:inyokaedit
	bzr branch lp:~elthoro/inyokaedit/packaging
	cp -f rules packaging
	mv packaging $(builddir)/debian
	VERSION=$(VERSION).$(REV)-0ubuntu1 ; $(changelog-entry)
	mv $(changelog-name) $(changelog-name).old
	cat $(changelog-name).new $(changelog-name).old > $(changelog-name)
	rm -rf $(builddir)/debian/.bzr $(builddir)/.bzr $(changelog-name).*

