include ../../mk/include.mk

deps           = wget git
srcfiles       = ffmpeg libdvd* vlc
cleanfiles     = libdvd* vlc vlc-$(VER)
tarball        = vlc-$(VER).txz
distcleanfiles = ffmpeg $(tarball)

VER = 2.2.4
SHA256 = 1632e91d2a0087e0ef4c3fb4c95c3c2890f7715a9d1d43ffd46329f428cf53be

download:
	test -d ffmpeg || git clone --depth 1 -b release/2.8 "https://github.com/FFmpeg/FFmpeg.git" ffmpeg
	test -d libdvdcss || git clone --depth 1 "http://code.videolan.org/videolan/libdvdcss.git"
	test -d libdvdread || git clone --depth 1 "http://code.videolan.org/videolan/libdvdread.git"
	test -d libdvdnav || git clone --depth 1 "http://code.videolan.org/videolan/libdvdnav.git"
	@ $(call download,$(tarball),http://download.videolan.org/pub/videolan/vlc/$(VER)/vlc-$(VER).tar.xz)
	@ $(call verifysha256,$(tarball),$(SHA256))
	rm -rf vlc
	tar xf $(tarball)
	mv vlc-$(VER) vlc
	rm -rf */.git
	@ VERSION=$(VER); $(changelog-entry)

