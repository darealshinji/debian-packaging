include ../../mk/include.mk

deps           = git
codir          = SSVOpenHexagon
srcfiles       = $(codir)/* ../../mk/make-icons.sh
distcleanfiles = $(codir) debian/config.mak

VERSION = 2.0~git


download: $(codir)/VERSION
ifeq ($(PBUILDER),1)
	cxx=$$(grep 'CXX_ =' debian/config.mak | awk '{print $$3}'); \
	if [ "$$cxx" = "gcc6opt-g++" -o "gcc5opt-g++" ]; then \
	  echo "error: cannot use $cxx with pbuilder!"; \
	  exit 1; \
	fi
endif

$(codir)/VERSION: debian/config.mak
	git clone --depth 1 "https://github.com/SuperV1234/SSVOpenHexagon.git"
	cd $(codir) && ./init-repository.sh
	git clone --branch 2.3.x --depth 1 "https://github.com/SFML/SFML.git" $(codir)/SFML
	@ latestcommit="$$(git -C $(codir) log -1 --format=%ci | head -c10 | sed 's|-||g')"; \
	VERSION="$(VERSION)$${latestcommit}"; \
	echo "$${VERSION}" > $@; \
	$(changelog-entry)
	rm -rf $(codir)/.git $(codir)/SFML/.git

debian/config.mak:
	test/stdcxx14_test.sh

