include ../../mk/include.mk

deps          = subversion dh-autoreconf
builddir      = abuse-trunk
changelog-msg = Current development snapshot

download:
	rm -rf $(builddir)
	svn co svn://svn.zoy.org/abuse/abuse/trunk $(builddir)
	@ REVISION=`svn info $(builddir) | grep '^Revision:' | cut -d' ' -f2`; \
	VERSION="1:0.8+svn$$REVISION" ; $(changelog-entry)
	rm -rf $(builddir)/.svn

