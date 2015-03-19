include ../../mk/include.mk

deps       = git
builddir   = screenFetch
cleanfiles = debian/changelog

download:
	git clone --depth 1 "https://github.com/KittyKatt/screenFetch.git"
	latestcommit=`git -C screenFetch/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'` ;\
	scriptVersion=`grep 'scriptVersion=' screenFetch/screenfetch-dev | cut -d'"' -f2` ;\
	VERSION="$${scriptVersion}+git$${latestcommit}" ;\
	sed -e "s/@VERSION@/$${VERSION}/g; s/@DATE@/`date -R`/g" debian/changelog.in > debian/changelog
