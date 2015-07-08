include ../../mk/include.mk

deps           = wget git dh-autoreconf
srcfiles       = ffmpeg fdk-aac x264 x265
cleanfiles     = $(srcfiles)
distcleanfiles = ffmpeg.tbz

download:
	rm -rf $(srcfiles)
	@ $(call download,ffmpeg.tbz,http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2)
	@ $(call download,x265.tar.bz2,https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2)
	git clone --depth 1 "git://git.videolan.org/x264.git"
	git clone --depth 1 "git://git.code.sf.net/p/opencore-amr/fdk-aac"

	tar xvf x265.tar.bz2 && mv multicoreware-x265-* x265
	cp -f ../../mk/config.* x264
	tar xvf ffmpeg.tbz

	@ latesttag=`grep 'latesttag:' x265/.hg_archival.txt|cut -d' ' -f2` ;\
	latesttagdistance=`grep 'latesttagdistance:' x265/.hg_archival.txt|cut -d' ' -f2` ;\
	echo "$${latesttag}+$${latesttagdistance}" > x265/VERSION
	sed -i 's@depth 8|10   @depth 8|10|12@' x265/source/x265cli.h

	@ VER=$$(grep -v 'version <next>:' ffmpeg/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://' -) ;\
	GIT=$$(cd ffmpeg && ./version.sh | sed -e 's/git-//' -e 's/N-//'); VERSION=8:$${VER}+$${GIT} ;\
	$(changelog-entry)

	rm -rf */.git x265/build

