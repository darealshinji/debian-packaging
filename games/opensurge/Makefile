include ../../mk/include.mk

deps       = wget subversion
bin        = AlFont209.rar
builddir   = opensurge-trunk
cleanfiles = $(bin)
srcfiles   = $(bin)


download:
	rm -rf $(builddir)
	svn checkout "svn://svn.code.sf.net/p/opensnc/code/opensurge/trunk/" $(builddir)
	@ ver=`grep '^SET(GAME_VERSION' $(builddir)/CMakeLists.txt | cut -d '"' -f2`; \
	rev=`svn info $(builddir) | grep '^Revision:' | cut -d' ' -f2`; \
	VERSION="$${ver}~svn$${rev}" ; $(changelog-entry)
	rm -rf $(builddir)/.svn
	$(call download,$(bin),http://opensnc.sourceforge.net/alfont/mirror/$(bin))
	sed -i 's|alfont alleg|alfont freetype alleg|g' $(builddir)/CMakeLists.txt

