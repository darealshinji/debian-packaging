include ../../mk/include.mk

deps       = git
builddir   = yasm-nextgen
cleanfiles = debian/changelog


download:
	git clone --depth 1 "https://github.com/yasm/yasm-nextgen.git"
	cp -f ../../mk/config.guess yasm-nextgen/autoconf
	@ VERSION=2.0.0~git`git -C yasm-nextgen/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'` ;\
	  $(changelog-entry)
	rm -rf config-git yasm-nextgen/.git

