include ../../mk/include.mk

deps     = git
builddir = alephone-source

download:
	rm -rf $(builddir)
	git clone https://github.com/darealshinji/aleph-one.git $(builddir)
	VER=`grep '^#define A1_DISPLAY_VERSION' $(builddir)/Source_Files/Misc/alephversion.h | cut -d '"' -f2`; \
	GITREV="`git -C $(builddir) rev-list HEAD --count`"; \
	VERSION="1:$${VER}+git$${GITREV}" ; $(changelog-entry)
	cd $(builddir) && rm -rf .git PBProjects

