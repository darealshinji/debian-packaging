include ../../mk/include.mk

deps           = wget git
srcfiles       = libdvd* vlc ffmpeg
cleanfiles     = $(srcfiles) vlc-$(VER)
tarball        = vlc-$(VER).txz
distcleanfiles = $(tarball)

VER = 2.2.2
SHA256 = 7f729245357f337f51f34b91fa896e5b62dd7bd06dc996bab88d9f5623eaedd3

download:
	git clone --depth 1 -b release/2.8 "https://github.com/FFmpeg/FFmpeg.git" ffmpeg
	git clone --depth 1 "git://git.videolan.org/libdvdcss.git"
	git clone --depth 1 "git://git.videolan.org/libdvdread.git"
	git clone --depth 1 "git://git.videolan.org/libdvdnav.git"
	@ $(call download,$(tarball),http://http.debian.net/debian/pool/main/v/vlc/vlc_$(VER).orig.tar.xz)
	@ $(call verifysha256,$(tarball),$(SHA256))
	tar xf $(tarball)
	mv vlc-$(VER) vlc
	rm -rf */.git
	@ VERSION=$(VER); $(changelog-entry)

