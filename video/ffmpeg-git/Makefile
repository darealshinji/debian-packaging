include ../../mk/include.mk

deps       = wget git
builddir   = ffmpeg
cleanfiles = libaacplus-2.0.2 multicoreware-x265-* *.zip

download:
	rm -rf ffmpeg
	git clone --depth 1 "git://source.ffmpeg.org/ffmpeg.git"
	git clone --depth 1 "git://git.videolan.org/x264.git" ffmpeg/x264
	git clone --depth 1 "git://git.code.sf.net/p/opencore-amr/fdk-aac" ffmpeg/fdk-aac
	git clone --depth 1 "https://github.com/ultravideo/kvazaar.git" ffmpeg/kvazaar
	@ $(call download,x265.tar.bz2,https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2)
	@ $(call download,libaacplus.tar.gz,http://ffmpeg.gusari.org/uploads/libaacplus-2.0.2.tar.gz)
	@ $(call download,26410-800.zip,http://www.3gpp.org/ftp/Specs/archive/26_series/26.410/26410-800.zip)

	@ $(call verifysha256,libaacplus.tar.gz,60dceb64d4ecf0be8d21661d5af2f214710f9d5b6ab389a5bdebf746baa7e1d7)
	@ $(call verifysha256,26410-800.zip,4e7b3268b4e21a4dc2c88ee3af57c9115334d6b616a6e5f2e3f43643bf37b72f)

	tar xf libaacplus.tar.gz && mv libaacplus-2.0.2 ffmpeg/libaacplus
	mv 26410-800.zip ffmpeg/libaacplus
	tar xf x265.tar.bz2 && mv multicoreware-x265-* ffmpeg/x265
	cp -f ../../mk/config.* ffmpeg/x264

	sed -i 's|-laacplus|-laacplus -lm -lfftw3f|g' ffmpeg/configure
	sed -i 's|-Werror||g' ffmpeg/kvazaar/src/Makefile
	@ latesttag=`grep 'latesttag:' ffmpeg/x265/.hg_archival.txt|cut -d' ' -f2`; \
	  latesttagdistance=`grep 'latesttagdistance:' ffmpeg/x265/.hg_archival.txt|cut -d' ' -f2`; \
	  echo "$${latesttag}+$${latesttagdistance}" > ffmpeg/x265/VERSION

	@ VER=$$(grep -v 'version <next>:' ffmpeg/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://' -); \
	  GIT=$$(cd ffmpeg && ./version.sh | sed -e 's/git-//' -e 's/N-//'); \
	  VERSION=8:$${VER}+$${GIT}; $(changelog-entry)

	rm -rf ffmpeg/.git ffmpeg/*/.git ffmpeg/x265/build x265.tar.bz2 libaacplus.tar.gz

