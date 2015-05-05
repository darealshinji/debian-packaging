include ../../mk/include.mk

deps          = git
srcfiles      = ffmpeg x264-source
cleanfiles    = $(srcfiles)
changelog-msg = Update to new upstream snapshot

download:
	git clone --depth 1 "git://git.videolan.org/x264.git" x264-source
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	cp -f ../../mk/config.* x264-source
	rm -rf ffmpeg/.git
	@ VERSION=2:$$(./version.sh) ; $(changelog-entry)

