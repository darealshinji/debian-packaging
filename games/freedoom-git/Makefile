include ../../mk/include.mk

deps     = git
builddir = freedoom

download:
	rm -rf $(builddir)
	git clone "https://github.com/freedoom/freedoom.git"

	@ latestcommit="$$(git -C freedoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')"; \
	version="$$(cat freedoom/VERSION | tr -d "v" | tr -d "\n")"; \
	tagver="$$(git -C freedoom/ describe --abbrev=0 --tags | sed -e 's/v//g')"; \
	test "$$version" = "$$tagver" && git="+git" || git="~git"; \
	VERSION="$${version}$${git}$${latestcommit}"; $(changelog-entry)

	cp -r files $(builddir)
	rm -rf $(builddir)/.git

