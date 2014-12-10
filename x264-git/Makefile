include ../Makefile.inc

deps = wget
srcfiles = ffmpeg l-smash x264-source
cleanfiles = $(srcfiles) debian/changelog
changelog-msg = Update to new upstream snapshot
srcpkg = x264

download:
	git clone --depth 1 "git://git.videolan.org/x264.git" x264-source
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	git clone --depth 1 "https://github.com/l-smash/l-smash.git"
	rm -rf ffmpeg/.git l-smash/.git

	cp -vf /usr/share/misc/config.guess x264-source
	cp -vf /usr/share/misc/config.sub x264-source

	VERSION=2:$$(./version.sh) ;\
	$(changelog-entry)

