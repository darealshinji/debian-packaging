include ../../mk/include.mk

deps = git

download:
	mkdir -p $(builddir)
	git clone -b master https://github.com/mpv-player/mpv.git $(builddir)/mpv
	git clone -b master --depth 1 "git://source.ffmpeg.org/ffmpeg.git" $(builddir)/ffmpeg

	@ latestcommit="`git -C $(builddir)/mpv/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'`" ; \
	VER="`git -C $(builddir)/mpv/ branch -r | grep 'origin/release/' | tail -n1 | cut -d '/' -f3`" ; \
	VERSION="1:$${VER}+git$${latestcommit}" ; $(changelog-entry)

	cd $(builddir)/mpv && ./bootstrap.py
	rm -rf $(builddir)/*/.git

