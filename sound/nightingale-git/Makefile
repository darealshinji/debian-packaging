include ../../mk/include.mk

deps           = wget git
builddir       = nightingale-hacking
distcleanfiles = ngdeps-tar-lzma
changelog-file = changelog.new

ngdepsver = 2015-02-28

ngdepsarch = i686
ngdeps_sum = b450191a6740fef203a81e8bab5a3574b316ac26e347f6bce9bdbe4d648e8ee5
ifeq ($(ARCH), amd64)
ngdepsarch = x86_64
ngdeps_sum = a0e4536222e94349eebd32dedc42d33f9d51605d4034aef08916ca6d955cf070
endif

ngdepsbin = linux-$(ngdepsarch)-lintian-release.tar.lzma
ngdepsurl = https://github.com/darealshinji/nightingale-deps/releases/download/$(ngdepsver)/$(ngdepsbin)
changelogurl = https://raw.githubusercontent.com/nightingale-media-player/nightingale-hacking/sb-trunk-oldxul/debian/changelog


download:
	test -d $(builddir) || git clone --depth 1 "https://github.com/nightingale-media-player/nightingale-hacking.git"
	@ $(call download,ngdeps-tar-lzma,$(ngdepsurl))
	@ $(call verifysha256,ngdeps-tar-lzma,$(ngdeps_sum))

	rm -rf $(builddir)/debian/*
	cp ngdeps-tar-lzma $(builddir)/dependencies/$(ngdepsbin)
	sed -i 's/-Os//g' $(builddir)/configure.ac

	$(call download,$(builddir)/debian/changelog.in,$(changelogurl))
	@ latestcommit=$$(git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	ngversion=$$(grep -e 'SB_MILESTONE=' $(builddir)/build/sbBuildInfo.mk.in | sed -e 's/SB_MILESTONE=//;') ;\
	VERSION=$${ngversion}+git$${latestcommit}-1 ; $(changelog-entry)
	cat changelog.new $(builddir)/debian/changelog.in > $(builddir)/debian/changelog

	cd $(builddir) && rm -rf .git tools/win32 vcproj documentation/sharing installer/macosx
	find $(builddir) -name *.mp3 -delete

