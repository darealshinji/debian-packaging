include ../../mk/include.mk

deps       = git
cleanfiles = debian/changelog
builddir   = chocolate_duke3D

download:
	git clone --depth 1 "https://github.com/fabiensanglard/chocolate_duke3D"
	@ latestcommit=`git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')` ;\
	VERSION="$${latestcommit}" ; $(changelog-entry)
	rm -rf $(builddir)/.git

