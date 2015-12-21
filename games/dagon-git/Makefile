include ../../mk/include.mk

deps       = git
builddir   = Dagon
cleanfiles = $(builddir) ../../mk/make-icons.sh

download:
	rm -rf $(builddir) && git clone "https://github.com/Senscape/Dagon.git"

	@ latestcommit=$$(git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	vermaj="`grep '#define DAGON_VERSION_MAJOR' $(builddir)/src/Version.h | cut -d' ' -f3`"; \
	vermin="`grep '#define DAGON_VERSION_MINOR' $(builddir)/src/Version.h | cut -d' ' -f3`"; \
	verrel="`grep '#define DAGON_VERSION_RELEASE' $(builddir)/src/Version.h | cut -d' ' -f3`"; \
	version="$${vermaj}.$${vermin}.$${verrel}"; \
	tagver="`git -C $(builddir) describe --abbrev=0 --tags | sed -e 's/v//g'`"; \
	test "$$version" = "$$tagver" && git="+git" || git="~git"; \
	VERSION="$${version}$${git}$${latestcommit}"; \
	echo "tagver: $$tagver ; srcver: $$version"; \
	$(changelog-entry)

	rm -rf $(builddir)/extlibs $(builddir)/.git

