include ../../mk/include.mk

deps       = wget
builddir   = $(srcpkg)
cleanfiles = $(builddir) *.tar.bz2 debian/changelog

download:
	@ $(call download,ffmpeg.tar.bz2,http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2)
	tar xvf ffmpeg.tar.bz2
	VER=$$(grep -v 'version <next>:' $(builddir)/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://;' -) ;\
	GIT=$$(cd $(builddir) && ./version.sh) ;\
	VERSION=8:$${VER}+$${GIT} ;\
	$(changelog-entry)

