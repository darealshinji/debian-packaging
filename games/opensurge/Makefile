include ../../mk/include.mk

deps       = subversion
builddir   = opensurge-trunk


download:
	rm -rf $(builddir)
	svn checkout "svn://svn.code.sf.net/p/opensnc/code/opensurge/trunk/" $(builddir)
	@ ver=`grep '^SET(GAME_VERSION' $(builddir)/CMakeLists.txt | cut -d '"' -f2`; \
	rev=`svn info $(builddir) | grep '^Revision:' | cut -d' ' -f2`; \
	VERSION="$${ver}~svn$${rev}" ; $(changelog-entry)
	rm -rf $(builddir)/.svn
	sed -i 's|alfont alleg|alfont freetype alleg|g' $(builddir)/CMakeLists.txt

