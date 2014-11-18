include ../Makefile.inc

deps = git asciidoc deutex gsfonts imagemagick
cleanfiles = freedoom debian/changelog


all: deps download build

nodeps: download build

build:
	$(buildpackage)

download: deps
	rm -rf freedoom
	git clone https://github.com/freedoom/freedoom.git

	# create new Debian changelog entry
	latestcommit=$$(git -C freedoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	VERSION=$$(cat freedoom/VERSION | tr -d "v" | tr -d "\n") ;\
	echo "freedoom ($$VERSION+git$$latestcommit-1~trusty) trusty; urgency=low" > changelog.new
	#echo "freedoom ($$VERSION-1) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * Current git snapshot" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new debian/changelog.in > debian/changelog
	rm changelog.new

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	debian/rules override_dh_auto_clean
	rm -rf build.log $(cleanfiles)

