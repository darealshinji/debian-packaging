include ../../mk/include.mk

deps           = wget git
builddir       = nightingale-hacking
changelog-file = changelog.new
cleanfiles     = usr
XULVERSION     = 20150228-1~trusty

download:
	@ $(call download,ngale-deps.deb,https://launchpad.net/~djcj/+archive/ubuntu/nightingale/+files/nightingale-deps_$(XULVERSION)_$(ARCH).deb)
	git clone --depth 1 "https://github.com/nightingale-media-player/nightingale-hacking.git"

	ar x ngale-deps.deb data.tar.xz
	tar xfv data.tar.xz
	rm -rf $(builddir)/debian/*
	mv usr/lib/nightingale-deps/* $(builddir)/dependencies && rm -rf usr

	$(call download,$(builddir)/debian/changelog.in,https://raw.githubusercontent.com/nightingale-media-player/nightingale-hacking/sb-trunk-oldxul/debian/changelog)
	latestcommit=$$(git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	ngversion=$$(grep -e 'SB_MILESTONE=' $(builddir)/build/sbBuildInfo.mk.in | sed -e 's/SB_MILESTONE=//;') ;\
	VERSION=$${ngversion}+git$${latestcommit}-1 ; $(changelog-entry)
	cat changelog.new $(builddir)/debian/changelog.in > $(builddir)/debian/changelog

	cd $(builddir) && rm -rf .git tools/win32 vcproj documentation/sharing installer/macosx
	find $(builddir) -name *.mp3 -delete

