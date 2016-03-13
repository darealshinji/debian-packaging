include ../../mk/include.mk

deps       = wget git
builddir   = ffmpeg
cleanfiles = multicoreware-x265-* *.zip

download:
	rm -rf ffmpeg
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	git clone --depth 1 "git://git.videolan.org/x264.git" ffmpeg/x264
	git clone --depth 1 "git://git.code.sf.net/p/opencore-amr/fdk-aac" ffmpeg/fdk-aac
	git clone --depth 1 "https://github.com/ultravideo/kvazaar" ffmpeg/kvazaar
	@ $(call download,x265.tar.bz2,https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2)

	tar xf x265.tar.bz2 && mv multicoreware-x265-* ffmpeg/x265
	cp -f ../../mk/config.* ffmpeg/x264

	@ latesttag=`grep 'latesttag:' ffmpeg/x265/.hg_archival.txt|cut -d' ' -f2`; \
	  latesttagdistance=`grep 'latesttagdistance:' ffmpeg/x265/.hg_archival.txt|cut -d' ' -f2`; \
	  echo "$${latesttag}+$${latesttagdistance}" > ffmpeg/x265/VERSION

	@ VER=$$(grep -v 'version <next>:' ffmpeg/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://' -); \
	  GIT=$$(cd ffmpeg && ./version.sh | sed -e 's/git-//' -e 's/N-//'); \
	  VERSION=8:$${VER}+$${GIT}; $(changelog-entry)

	rm -rf ffmpeg/.git ffmpeg/*/.git ffmpeg/x265/build x265.tar.bz2

