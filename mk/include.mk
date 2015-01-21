export LANG=C
export LANGUAGE=C
export LC_ALL=C




ARCH      = $(shell dpkg-architecture -qDEB_HOST_ARCH)
builddir  = pbuilder-source
LOG       = $(shell basename $$PWD)-build.log
resultdir = "$$HOME/buildresult"
basetgz   = "/var/cache/pbuilder/debian-packages-$(ARCH).tgz"




define verifysha256
    sha256_2=$$(sha256sum $(1) | head -c64) ;                      \
    if [ $$sha256_2 != $(2) ] ; then                               \
        echo "$(1):" ;                                             \
        echo "SHA256 checksum is $$sha256_2 but should be $(2)." ; \
        echo "Delete '$(1)' and try it again." ;                   \
        exit 1 ;                                                   \
    else                                                           \
        echo "$(1): checksum ok." ;                                \
    fi
endef




MAINTAINER      = Marshall Banana <djcj@gmx.de>
changelog-msg   = Current git snapshot
changelog-file  = $(builddir)/debian/changelog
srcpkg          = `grep 'Source: ' debian/control | cut -d' ' -f2`

changelog-entry =                                                              \
    mkdir -p $(shell dirname $(changelog-file)) ;                              \
    echo "$(srcpkg) ($${VERSION}) unstable; urgency=low" > $(changelog-file) ; \
    echo ""                                             >> $(changelog-file) ; \
    echo "  * $(changelog-msg)"                         >> $(changelog-file) ; \
    echo ""                                             >> $(changelog-file) ; \
    echo " -- $(MAINTAINER)  `date -R`"                 >> $(changelog-file) ; \
    echo ""                                             >> $(changelog-file)




allcleanfiles = .pc                  \
                $(LOG)               \
                changelog.new        \
                converted_icons      \
                tmp                  \
                temp                 \
                *.changes            \
                *.deb                \
                *.dsc                \
                *.tar.?z*            \
                $(builddir)          \
                $(cleanfiles)

alldeps  = debhelper quilt aptitude $(deps)
ifneq ($(PBUILDER),0)
alldeps += pbuilder
endif




all: predepends download source build


clean:
	rm -rf $(allcleanfiles)


distclean: clean
	rm -rf $(distcleanfiles)


predepends:
ifeq ($(DEPS),0)
	@ echo "dependency checks skipped"
else
	@ echo ""
	@ echo "checking dependencies:"
	@ $(foreach DEP, $(alldeps),                                                                 \
	echo $(DEP);                                                                                 \
	if [ $$(dpkg-query -W -f='$${Status}' $(DEP) 2>/dev/null | grep -c "ok installed") -eq 0 ] ; \
	then                                                                                         \
	    echo "You need to install the package '$(DEP)'" ;                                        \
	    sudo -k apt-get -q install $(DEP) ;                                                      \
	fi ;)
	@ echo ""
endif


source: download
	mkdir -p $(builddir)
	cp -r ../../mk/make-icons.sh $(srcfiles) $(builddir)
	test -d debian && cp -rf debian $(builddir) || true


build: source
	rm -rf .pc
	@ if [ -f $(builddir)/debian/patches/series ] ;                   \
	then                                                              \
	   cd $(builddir) && QUILT_PATCHES=debian/patches quilt push -a ; \
	   rm -rf $(builddir)/.pc ;                                       \
	fi
	echo '3.0 (native)' > $(builddir)/debian/source/format
	dpkg-source -b $(builddir)

ifeq ($(PBUILDER),0)
ifneq ($(DEPS),0)
	@ cd $(builddir) ;                                                                                      \
	builddeps="`dpkg-checkbuilddeps 2>&1 | sed -e 's/dpkg-checkbuilddeps: Unmet build dependencies: //;'`"; \
	if [ $$(printf $$builddeps | wc -m) -gt 0 ] ;                                                           \
	then                                                                                                    \
	    echo "" ;                                                                                           \
	    echo "You need to install the following build dependencies:" ;                                      \
	    echo "$$builddeps" ;                                                                                \
	    echo "" ;                                                                                           \
	    sudo -k $(CURDIR)/../../mk/pbuilder-satisfydepends.sh ;                                             \
	fi
endif
	mkdir -p $(resultdir)
	cd $(builddir) && dpkg-buildpackage -b -us -uc 2>&1 | tee $(LOG)
	rm -f *.changes
	mv *.deb $(resultdir)
else
	@ if [ ! -f $(basetgz) ] ;                                        \
	then                                                              \
	    echo "" ;                                                     \
	    echo "sudo password required to create $(basetgz):" ;         \
	    sudo -k pbuilder                                              \
	         --create                                                 \
	         --components "main restricted universe multiverse"       \
		 --debootstrapopts --arch --debootstrapopts $(ARCH)       \
	         --debootstrapopts --variant=buildd                       \
	         --basetgz $(basetgz)                                     \
	         --extrapackages "debhelper fakeroot" ;                   \
	fi

	mkdir -p $(resultdir)
	@ echo ""
	@ echo "sudo password required to run pbuilder:"
	sudo -k pbuilder --build --basetgz $(basetgz) --buildresult $(resultdir) *.dsc 2>&1 | tee $(LOG)
endif


	rm -f $(resultdir)/*.dsc
	rm -f $(resultdir)/*.changes
	rm -f $(resultdir)/*.tar.?z*


	@ echo ""
	@ echo ""
	@ for f in $(resultdir)/*.deb ;      \
	do                                   \
	    echo "$$f:" ;                    \
	    dpkg-deb -I $$f ;                \
	    lintian $$f ;                    \
	    echo "" ;                        \
	done 2>&1 | tee -a $(LOG) ;          \
	                                     \
	for f in $(resultdir)/*.deb ;        \
	do                                   \
	    echo "$$f:" ;                    \
	    dpkg-deb -c $$f ;                \
	    echo "" ;                        \
	done 2>&1 | tee -a $(LOG)


	@ echo ""
	@ if [ $$(dpkg-query -W -f='$${Status}' pbuilder-satisfydepends-dummy 2>/dev/null | grep -c "ok installed") -ne 0 ] ; \
	then                                                                                                                  \
	    echo "Additional build dependencies have been installed." ;                                                       \
	    read -p "Do you want to remove them (recommended)? (Y/n) " REMOVE ;                                               \
	    if [ x$$REMOVE = xy ] || [ x$$REMOVE = xY ] || [ x$$REMOVE = x ] ;                                                \
	    then                                                                                                              \
	         sudo -k apt-get autoremove --purge pbuilder-satisfydepends-dummy ;                                           \
	    fi                                                                                                                \
	fi


