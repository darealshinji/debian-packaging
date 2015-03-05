include ../../mk/include.mk

# Chocolate Duke3D doesn't build on amd64
ARCH       = i386
deps       = git
cleanfiles = debian/changelog
builddir   = chocolate_duke3D

download:
	#git clone --depth 1 "https://github.com/fabiensanglard/chocolate_duke3D.git"
	git clone --depth 1 -b patch-1 "https://github.com/darealshinji/chocolate_duke3D.git"
	latestcommit=`git -C chocolate_duke3D/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')` ;\
	sed -e "s/@VERSION@/1.0~git$${latestcommit}/g; s/@DATE@/`date -R`/g" debian/changelog.in > debian/changelog
	rm -rf chocolate_duke3D/.git

