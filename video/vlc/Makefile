include ../../mk/include.mk

deps           = wget git
srcfiles       = libdvd* vlc ffmpeg
cleanfiles     = $(srcfiles) vlc-$(VER)
tarball        = vlc-$(VER).txz
distcleanfiles = $(tarball)

VER = 2.2.2
SHA256 = 9ad23128be16f9b40ed772961272cb0748ed8e4aa1bc79c129e589feebea5fb5

download:
	git clone --depth 1 -b release/2.8 "https://github.com/FFmpeg/FFmpeg.git" ffmpeg
	git clone --depth 1 "git://git.videolan.org/libdvdcss.git"
	git clone --depth 1 "git://git.videolan.org/libdvdread.git"
	git clone --depth 1 "git://git.videolan.org/libdvdnav.git"
	@ $(call download,$(tarball),http://download.videolan.org/pub/videolan/vlc/$(VER)/$(tarball))
	@ $(call verifysha256,$(tarball),$(SHA256))
	tar xf $(tarball)
	mv vlc-$(VER) vlc
	rm -rf */.git
	@ VERSION=$(VER); $(changelog-entry)

