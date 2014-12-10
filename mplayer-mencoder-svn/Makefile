include ../Makefile.inc

VERSION = 2:1.1.1

deps = wget git
bin = mplayer-export-snapshot.tar.bz2
cleanfiles = debian/changelog
builddir = mplayer-export
srcpkg = mplayer
changelog-file = debian/changelog
changelog-msg = Current svn snapshot

download:
	wget "http://mplayerhq.hu/MPlayer/releases/$(bin)"
	mkdir -p $(builddir)
	cd $(builddir) && tar xvf ../$(bin)
	mv $(builddir)/mplayer-export-*/* $(builddir)

	git clone -b master --depth 1 "git://source.ffmpeg.org/ffmpeg.git" $(builddir)/ffmpeg

	REV=$$(cat $(builddir)/snapshot_version | cut -d- -f1) ;\
	VERSION=$(VERSION)+svn$${REV} ;\
	$(changelog-entry)

	cd $(builddir) && \
	rm -rf debian ffmpeg/mp_auto_pull ffmpeg/.git mplayer-export-*

