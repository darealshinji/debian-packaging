include ../../mk/include.mk

deps           = wget
builddir       = zandronum-source
fmod           = fmodapi42416linux$(FMOD_64)
distcleanfiles = *.tgz

sha256sum_fmod = a516e48c0c715c31efdc0c810f26188c2bb484615e7a5e53ca936ad1d5e0b18d
ifeq ($(ARCH),amd64)
sha256sum_fmod = de545ab90c4f137a8e1734ed1891c7e28fa257d9cb7e6c953bedfd0fd9a77c42
FMOD_64        = 64
endif

download:
	@ $(call download,zandronum.tar.gz,https://bitbucket.org/Torr_Samaho/zandronum/get/tip.tar.bz2)
	@ $(call download,$(fmod).tgz,http://zandronum.com/essentials/fmod/$(fmod).tar.gz)
	@ $(call verifysha256,$(fmod).tgz,$(sha256sum_fmod))

	tar xvf zandronum.tar.gz
	mv Torr_Samaho-zandronum-* $(builddir)
	cp $(fmod).tgz $(builddir)

	# link the executable against the system's sqlite3 library
	sed -i '/add_subdirectory( sqlite )/d' $(builddir)/CMakeLists.txt

	@ latesttag="$$(grep '^latesttag:' $(builddir)/.hg_archival.txt|cut -d' ' -f2|sed 's|ZA_||')"; \
	latesttagdistance="$$(grep '^latesttagdistance:' $(builddir)/.hg_archival.txt|cut -d' ' -f2)"; \
	VERSION="$${latesttag}+hg$${latesttagdistance}"; $(changelog-entry)

