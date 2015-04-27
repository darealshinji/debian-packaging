include ../../mk/include.mk

# Chocolate Duke3D doesn't build on amd64
ARCH       = i386
deps       = git
cleanfiles = debian/changelog
builddir   = chocolate_duke3D

download:
	git clone --depth 1 "https://github.com/fabiensanglard/chocolate_duke3D.git"
	latestcommit=`git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')` ;\
	VERSION="1.0+git$${latestcommit}" ; $(changelog-entry)
	rm -rf $(builddir)/.git
	mv $(builddir)/Makefile $(builddir)/Makefile-old
	cp debian/chocolate-duke3d.make $(builddir)/Makefile

