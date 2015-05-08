include ../../mk/include.mk

deps     = subversion
builddir = alephone-trunk

download:
	rm -rf $(builddir)
	svn co --ignore-externals "svn://svn.code.sf.net/p/marathon/code/trunk" $(builddir)

	# Let's link Aleph One against the system's expat library, because
	# embedded libexpat is considered a bug in Debian packaging.
	sed -i 's@Source_Files/Expat/Makefile@@' $(builddir)/configure.ac
	sed -i 's@Expat/libexpat.a@-lexpat@g; s/ Expat / /' $(builddir)/Source_Files/Makefile.am

	@ VER=`grep '^#define A1_DISPLAY_VERSION' $(builddir)/Source_Files/Misc/alephversion.h | cut -d '"' -f2`; \
	REV=`svn info $(builddir) | grep '^Revision:' | cut -d' ' -f2`; \
	VERSION="$${VER}+svn$${REV}" ; $(changelog-entry)

	cd $(builddir) && rm -rf .svn PBProjects Source_Files/Expat

