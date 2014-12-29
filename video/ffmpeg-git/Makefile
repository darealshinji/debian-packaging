include ../../Makefile.inc

deps = wget
srcpkg = ffmpeg
builddir = $(srcpkg)
cleanfiles = $(builddir) *.tar.bz2 debian/changelog

download:
	wget "http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2"
	tar xvf ffmpeg-snapshot.tar.bz2
	VER=$$(grep -v 'version <next>:' $(builddir)/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://;' -) ;\
	GIT=$$(cd $(builddir) && ./version.sh) ;\
	VERSION=8:$${VER}+$${GIT} ;\
	$(changelog-entry)

