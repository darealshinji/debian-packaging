include ../../mk/include.mk

deps = git

download:
	git clone -b master "https://github.com/mpv-player/mpv.git" $(builddir)
	git clone -b master --depth 1 "git://source.ffmpeg.org/ffmpeg.git" $(builddir)/ffmpeg

	@ latestcommit="`git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'`" ; \
	VER="`git -C $(builddir)/ tag | sort -V | tail -n1 | tr -d 'v'`" ; \
	VERSION="1:$${VER}+git$${latestcommit}" ; $(changelog-entry) ; \
	echo "$${VER}+git$${latestcommit}" > $(builddir)/VERSION

	cd $(builddir) && ./bootstrap.py
	rm -rf $(builddir)/.git $(builddir)/ffmpeg/.git

