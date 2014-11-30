include ../Makefile.inc

builddir = yua
deps = git automake libqt4-dev libqt4-opengl-dev upx-ucl zlib1g-dev
cleanfiles = yua debian

build: build-default

download: clean
	git clone "https://github.com/darealshinji/yua.git"

	# create new Debian changelog entry
	mv yua/debian-upstream/changelog yua/debian-upstream/changelog.in
	latestcommit=$$(git -C yua/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	VERSION=$$(git -C yua/ describe --abbrev=0 --tags | cut -d- -f1 | sed -e 's/v//g') ;\
	echo "yua ($$VERSION+git$$latestcommit-1) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * Current git snapshot" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new yua/debian-upstream/changelog.in > \
	yua/debian-upstream/changelog

	mv yua/debian-upstream yua/debian
	cp -f rules control yua/debian
	chmod a+x yua/debian/rules
	# don't use UPX to compress Yua
	sed -i '/$$(UPX) $$(APP)/d' yua/Makefile

