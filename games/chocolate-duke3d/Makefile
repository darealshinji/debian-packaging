include ../../mk/include.mk

deps       = git
cleanfiles = debian/changelog
builddir   = chocolate_duke3D

download:
	git clone --depth 1 -b patched "https://github.com/darealshinji/chocolate_duke3D.git"
	latestcommit=`git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')` ;\
	VERSION="1.0+git$${latestcommit}" ; $(changelog-entry)
	rm -rf $(builddir)/.git

