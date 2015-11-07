include ../../mk/include.mk

deps          = git
srcfiles      = ffmpeg x262-source
cleanfiles    = $(srcfiles) debian/changelog
changelog-msg = Update to new upstream snapshot

download:
	git clone "git://git.videolan.org/x262.git" x262-source
	git clone --branch release/2.8 --depth 1 "https://github.com/FFmpeg/FFmpeg.git" ffmpeg
	cp -f ../../mk/config.* x262-source
	rm -rf ffmpeg/.git
	@ VERSION=$$(./version.sh) ; $(changelog-entry)

