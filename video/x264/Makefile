include ../../mk/include.mk

deps          = git
srcfiles      = ffmpeg x264-source
cleanfiles    = $(srcfiles) debian/changelog
changelog-msg = Update to new upstream snapshot

download:
	git clone --depth 1 "git://git.videolan.org/x264.git" x264-source
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	git clone --depth 1 "git://git.savannah.gnu.org/config.git" config-git
	cp -f config-git/config.* x264-source
	rm -rf ffmpeg/.git config-git
	@ VERSION=2:$$(./version.sh) ; $(changelog-entry)

