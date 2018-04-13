include ../../mk/include.mk

deps           = git
distcleanfiles = gzdoom
srcfiles       = gzdoom/*

download:
	test -d gzdoom || git clone "https://github.com/coelckers/gzdoom.git"
	@ latestcommit="$$(git -C gzdoom log -1 --format=%ci | head -c10 | sed -e 's/-//g')"; \
	version="$$(git -C gzdoom describe --abbrev=0 --tags | sed -e 's|g||; s|pre|~pre|;')"; \
	VERSION="$${version}+git$${latestcommit}"; \
	$(changelog-entry)

