include ../../mk/include.mk

deps     = git
builddir = alephone-source

download:
	rm -rf $(builddir)
	git clone -b patched https://github.com/darealshinji/aleph-one.git $(builddir)
	VER=`grep '^#define A1_DISPLAY_VERSION' $(builddir)/Source_Files/Misc/alephversion.h | cut -d '"' -f2`; \
	SVNREV=`grep '\t* \[r' $(builddir)/ChangeLog | head -n1 | cut -d' ' -f2 | sed 's/\[r//; s/\]//;'`; \
	GITREV=`git -C $(builddir) rev-list HEAD --count`; \
	VERSION="$${VER}+svn$${SVNREV}reallygit$${GITREV}" ; $(changelog-entry)
	rm -rf $(builddir)/.git

