include ../Makefile.inc

builddir = patchelfmod
deps = git dh-autoreconf libacl1-dev libattr1-dev
cleanfiles = $(builddir) debian changelog.new

download: clean
	git clone "https://github.com/darealshinji/patchelfmod.git"

	# create new Debian changelog entry
	mv $(builddir)/debian-upstream/changelog $(builddir)/debian-upstream/changelog.in
	latestcommit=$$(git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	VERSION=$$(cat $(builddir)/version | tr -d "\n") ;\
	echo "patchelfmod ($$VERSION+git$$latestcommit-1) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * Current git snapshot" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new

	cat changelog.new $(builddir)/debian-upstream/changelog.in > \
	$(builddir)/debian-upstream/changelog
	rm changelog.new
	mv $(builddir)/debian-upstream $(builddir)/debian

