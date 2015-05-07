include ../../mk/include.mk

deps = git

download:
	rm -rf $(builddir)
	git clone git://git.code.sf.net/p/aften/code $(builddir)
	@ latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-'`; \
	VERSION="0.0.8+git$${latestcommit}"; $(changelog-entry)

