include ../../mk/include.mk

deps     = git
builddir = polly-b-gone


download:
	git clone --depth 1 "https://github.com/darealshinji/polly-b-gone.git"
	@ latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'`; \
	VERSION="1.0+git$$latestcommit"; $(changelog-entry)
	rm -rf polly-b-gone/.git

