include ../../mk/include.mk

deps          = git autotools-dev
srcfiles      = ffmpeg x264-source
cleanfiles    = $(srcfiles) debian/changelog
changelog-msg = Update to new upstream snapshot

download:
	git clone --depth 1 "git://git.videolan.org/x264.git" x264-source
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	rm -rf ffmpeg/.git
	cp -vf /usr/share/misc/config.guess x264-source
	cp -vf /usr/share/misc/config.sub x264-source
	@ VERSION=2:$$(./version.sh)-1 ; $(changelog-entry)

