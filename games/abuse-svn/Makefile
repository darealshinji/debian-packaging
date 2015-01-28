include ../../mk/include.mk

deps          = subversion dh-autoreconf
builddir      = abuse-trunk
changelog-msg = Current development snapshot

VERSION  = 0.8
REVISION = `svn info $(builddir) | grep 'Revision:' | cut -d' ' -f2`

download:
	svn co svn://svn.zoy.org/abuse/abuse/trunk $(builddir)
	VERSION=1:$(VERSION)+svn$(REVISION) ; $(changelog-entry)
	rm -rf $(builddir)/.svn

