include ../../mk/include.mk

deps     = wget
builddir = $(srcpkg)

download:
	@ $(call download,ffmpeg.tar.bz2,http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2)
	tar xvf ffmpeg.tar.bz2
	@ VER=$$(grep -v 'version <next>:' $(builddir)/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://' -) ;\
	GIT=$$(cd $(builddir) && ./version.sh | sed 's/git-/git/'); VERSION=8:$${VER}+$${GIT} ;\
	$(changelog-entry)

