include ../../mk/include.mk

deps       = wget git
builddir   = libav

download:
	rm -rf $(srcfiles)
	git clone --depth 1 "git://git.libav.org/libav.git"
	@ $(call download,x265.tar.bz2,https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2)
	git clone --depth 1 "git://git.videolan.org/x264.git" libav/x264
	git clone --depth 1 "git://git.code.sf.net/p/opencore-amr/fdk-aac" libav/fdk-aac
	git clone --depth 1 "https://github.com/ultravideo/kvazaar.git" libav/kvazaar

	tar xvf x265.tar.bz2 && mv multicoreware-x265-* libav/x265
	cp -f ../../mk/config.* libav/x264
	sed -i 's/-Werror//g' libav/kvazaar/src/Makefile

	@ latesttag=`grep 'latesttag:' libav/x265/.hg_archival.txt|cut -d' ' -f2` ;\
	latesttagdistance=`grep 'latesttagdistance:' libav/x265/.hg_archival.txt|cut -d' ' -f2` ;\
	echo "$${latesttag}+$${latesttagdistance}" > libav/x265/VERSION

	@ VERSION=7:$$(cd libav && echo `cat RELEASE`+`git describe --always 2> /dev/null` | tr '_' '~') ;\
	$(changelog-entry)

	rm -rf libav/.git libav/*/.git libav/x265/build x265.tar.bz2

