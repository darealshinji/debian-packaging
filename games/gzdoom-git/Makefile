include ../../mk/include.mk

deps       = git
builddir   = gzdoom

download:
	rm -rf gzdoom && git clone "https://github.com/coelckers/gzdoom.git"
	@ latestcommit=$$(git -C gzdoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	TAG_VERSION=$$(git -C gzdoom/ describe --abbrev=0 --tags | sed -e 's/g//g; s/\.pre/~pre/g'); \
	VERSION="$$TAG_VERSION+git$${latestcommit}"; \
	$(changelog-entry)

