include ../../mk/include.mk

deps           = wget git
srcfiles       = libdvd* vlc ffmpeg
cleanfiles     = $(srcfiles) vlc-$(VER)
tarball        = vlc-$(VER).txz
distcleanfiles = $(tarball)

VER = 2.2.1
SHA256 = 543d9d7e378ec0fa1ee2e7f7f5acf8c456c7d0ecc32037171523197ef3cf1fcb

download:
	git clone --depth 1 -b release/2.8 "https://github.com/FFmpeg/FFmpeg.git" ffmpeg
	git clone --depth 1 "git://git.videolan.org/libdvdcss.git"
	git clone --depth 1 "git://git.videolan.org/libdvdread.git"
	git clone --depth 1 "git://git.videolan.org/libdvdnav.git"
	@ $(call download,$(tarball),ftp://ftp.videolan.org/pub/videolan/vlc/$(VER)/vlc-$(VER).tar.xz)
	@ $(call verifysha256,$(tarball),$(SHA256))
	tar xf $(tarball)
	mv vlc-$(VER) vlc
	rm -rf */.git
	@ VERSION=$(VER); $(changelog-entry)

