include ../../mk/include.mk

deps          = git autotools-dev
srcfiles      = ffmpeg x262-source
cleanfiles    = $(srcfiles) debian/changelog
changelog-msg = Update to new upstream snapshot

download:
	git clone --depth 1 "git://git.videolan.org/x262.git" x262-source
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	rm -rf ffmpeg/.git
	cp -vf /usr/share/misc/config.guess x262-source
	cp -vf /usr/share/misc/config.sub x262-source
	@ VERSION=$$(./version.sh) ; $(changelog-entry)

