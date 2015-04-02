include ../../mk/include.mk

deps          = git
srcfiles      = ffmpeg x262-source
cleanfiles    = $(srcfiles) debian/changelog
changelog-msg = Update to new upstream snapshot

download:
	git clone "git://git.videolan.org/x262.git" x262-source
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	cp -f ../../mk/config.* x262-source
	rm -rf ffmpeg/.git
	@ VERSION=$$(./version.sh) ; $(changelog-entry)

