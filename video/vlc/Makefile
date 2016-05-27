include ../../mk/include.mk

deps           = wget git
srcfiles       = libdvd* vlc ffmpeg
cleanfiles     = $(srcfiles) vlc-$(VER)
tarball        = vlc-$(VER).txz
distcleanfiles = $(tarball)

VER = 2.2.3
SHA256 = b9d7587d35f13c3c981964c8cc8b03f1c7c8edf528be476b3ca1d2efedd5bf5b

download:
	test -d ffmpeg || git clone --depth 1 -b release/2.8 "https://github.com/FFmpeg/FFmpeg.git" ffmpeg
	test -d libdvdcss || git clone --depth 1 "git://git.videolan.org/libdvdcss.git"
	test -d libdvdread || git clone --depth 1 "git://git.videolan.org/libdvdread.git"
	test -d libdvdnav || git clone --depth 1 "git://git.videolan.org/libdvdnav.git"
	@ $(call download,$(tarball),http://download.videolan.org/pub/videolan/vlc/$(VER)/vlc-$(VER).tar.xz)
	@ $(call verifysha256,$(tarball),$(SHA256))
	rm -rf vlc
	tar xf $(tarball)
	mv vlc-$(VER) vlc
	rm -rf */.git
	@ VERSION=$(VER); $(changelog-entry)

