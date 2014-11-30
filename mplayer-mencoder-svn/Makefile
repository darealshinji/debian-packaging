include ../Makefile.inc

builddir = mplayer-export
archive = mplayer-export-snapshot.tar.bz2
cleanfiles = $(builddir) $(archive)

build: build-default

download: clean
	wget "http://mplayerhq.hu/MPlayer/releases/$(archive)"
	tar xvf $(archive) && rm -f $(archive)
	mv mplayer-export-* $(builddir)
	git clone -b master --depth 1 "git://source.ffmpeg.org/ffmpeg.git" $(builddir)/ffmpeg
	rm -rf $(builddir)/debian
	cp -r debian-files $(builddir)/debian
	REV=$$(cat $(builddir)/snapshot_version | cut -d- -f1) ;\
	sed -e "s/@REV@/$$REV/; s/@DATE@/$$(date -R)/;" \
	$(builddir)/debian/changelog.in > $(builddir)/debian/changelog

