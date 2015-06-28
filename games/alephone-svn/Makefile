include ../../mk/include.mk

deps     = subversion svn2cl
builddir = alephone-trunk

download:
	[ -d $(builddir) ] || debian/rules get-orig-source
	VERSION=`cat $(builddir)/VERSION` ; $(changelog-entry)

