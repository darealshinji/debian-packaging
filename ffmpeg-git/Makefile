include ../Makefile.inc

builddir = ffmpeg
cleanfiles = $(builddir) ffmpeg-snapshot.tar.bz2

make-control = \
test -f /usr/include/frei0r.h && \
sed -e 's/@//g' $(builddir)/debian/control.in > $(builddir)/debian/control || \
grep -v '@' $(builddir)/debian/control.in > $(builddir)/debian/control

download: clean
	wget "http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2"

	tar xvf ffmpeg-snapshot.tar.bz2
	rm -rf $(builddir)/debian
	cp -r debian $(builddir)
	$(make-control)

	VER=$$(grep -v 'version <next>:' $(builddir)/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://;' -) ;\
	GIT=$$(cd $(builddir) && ./version.sh) ;\
	echo "ffmpeg (8:$${VER}+$${GIT}) unstable; urgency=low" > $(builddir)/debian/changelog
	echo "" >> $(builddir)/debian/changelog
	echo "  * Current git snapshot" >> $(builddir)/debian/changelog
	echo "" >> $(builddir)/debian/changelog
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> $(builddir)/debian/changelog
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> $(builddir)/debian/changelog
	echo "" >> $(builddir)/debian/changelog

