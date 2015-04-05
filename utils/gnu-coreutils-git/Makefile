include ../../mk/include.mk

deps     = git
builddir = coreutils

download:
	git clone --depth 1 git://git.sv.gnu.org/coreutils
	cd $(builddir) && git submodule init && git submodule update
	@ latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION=`cat $(builddir)/.prev-version`+git$${latestcommit}; $(changelog-entry)
	rm -rf $(builddir)/.git

