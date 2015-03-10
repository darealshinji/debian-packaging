include ../../mk/include.mk

deps           = wget
builddir       = zandronum-source
fmod           = fmodapi42416linux$(FMOD_64)
cleanfiles     = debian/changelog
distcleanfiles = *.tgz

sha256sum_fmod   = a516e48c0c715c31efdc0c810f26188c2bb484615e7a5e53ca936ad1d5e0b18d
ifeq ($(ARCH),amd64)
sha256sum_fmod   = de545ab90c4f137a8e1734ed1891c7e28fa257d9cb7e6c953bedfd0fd9a77c42
FMOD_64          = 64
endif

download:
	test -f tip.tar.bz2 || wget "https://bitbucket.org/Torr_Samaho/zandronum/get/tip.tar.bz2"
	test -f $(fmod).tgz || wget -O $(fmod).tgz "http://zandronum.com/essentials/fmod/$(fmod).tar.gz"
	@ $(call verifysha256,$(fmod).tgz,$(sha256sum_fmod))

	tar xvf tip.tar.bz2
	mv Torr_Samaho-zandronum-* $(builddir)
	cp $(fmod).tgz $(builddir)

	# link the executable against the system's sqlite3 library
	sed -i '/add_subdirectory( sqlite )/d' $(builddir)/CMakeLists.txt

	@ latesttag=`grep 'latesttag:' $(builddir)/.hg_archival.txt|cut -d' ' -f2` ;\
	latesttagdistance=`grep 'latesttagdistance:' $(builddir)/.hg_archival.txt|cut -d' ' -f2` ;\
	VERSION=$${latesttag}+$${latesttagdistance} ;\
	$(changelog-entry)

