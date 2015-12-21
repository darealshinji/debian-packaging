include ../../mk/include.mk

deps = git

download:
	rm -rf $(builddir)
	git clone --depth 1 "https://github.com/ultravideo/kvazaar.git" $(builddir)
	git -C $(builddir) submodule init
	git -C $(builddir) submodule update
	@ ver="$$(grep 'KVZ_VERSION' $(builddir)/src/global.h | head -n1 | cut -d ' ' -f3)"; \
	latestcommit="$$(git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-')"; \
	VERSION="$${ver}+git$${latestcommit}"; $(changelog-entry)
	mkdir -p $(builddir)/m4

