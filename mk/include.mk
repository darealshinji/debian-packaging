# The MIT License (MIT)
#
# Copyright (C) 2014-2016, djcj <djcj@gmx.de>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


export LANG=C
export LANGUAGE=C
export LC_ALL=C

ARCH     = $(shell dpkg-architecture -qDEB_HOST_ARCH)
ARCHREAL = $(shell dpkg-architecture -qDEB_HOST_ARCH)

include ../../mk/create_basetgz.mk

default_compat    = 9
compression       = gzip
compression_level = 6

builddir    = pbuilder-source
LOG         = $(shell basename $$PWD)-build.log
TIME        = TIME="\nTime elapsed: %E\n" time
resultdir   = "$$HOME/buildresult"
JOBS        = $(shell nproc)
pbuildercmd = pbuilder --build --debbuildopts "-j$(JOBS)" \
			--basetgz $(basetgz) --buildresult $(resultdir) *.dsc

MAKE ?= make




# $(call verifysha256,FILE,SHA256_CHECKSUM)
define verifysha256
	sha256_2=$$(sha256sum $(1) | head -c64) ;                      \
	if [ $$sha256_2 != $(2) ] ;                                    \
	then                                                           \
	    echo "$(1):" ;                                             \
	    echo "SHA256 checksum is $$sha256_2 but should be $(2)." ; \
	    echo "Delete '$(1)' and try it again." ;                   \
	    exit 1 ;                                                   \
	else                                                           \
	    echo "$(1): checksum ok." ;                                \
	fi
endef


# $(call download,TARGET_FILENAME,URL)
define download
	test -f $(1) || wget -O $(1) '$(2)'
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
                *.build              \
                *.buildinfo          \
                *.changes            \
                *.deb                \
                *.ddeb               \
                *.dsc                \
                *.tar.?z*            \
                $(builddir)          \
                $(cleanfiles)

alldeps = build-essential lintian time quilt
ifeq ($(PBUILDER),1)
alldeps += pbuilder
else
alldeps += aptitude debhelper fakeroot libfile-fcntllock-perl
endif
alldeps += $(deps)




ifdef PBUIDLER
all:
	@ echo "Did you mean \`PBUILDER'?"
else
all: predepends download source build
endif

clean:
	rm -rf $(allcleanfiles)

distclean: clean
	rm -rf $(distcleanfiles)


pbuilder:
	$(MAKE) -f Makefile all PBUILDER=1

pbuilder-amd64:
	$(MAKE) -f Makefile all PBUILDER=1 ARCH=amd64

pbuilder-i386:
	$(MAKE) -f Makefile all PBUILDER=1 ARCH=i386


predepends:
ifneq ($(PBUILDER),1)
	@ echo ""
	@ if [ $(ARCH) != $(ARCHREAL) ] ;                                             \
	then                                                                          \
		echo "Cannot build packages for $(ARCH) architecture without pbuilder." ; \
		echo "Try again with \`PBUILDER=1'" ;                                     \
		echo "" ;                                                                 \
		exit 1 ;                                                                  \
	fi
endif #PBUILDER
ifeq ($(DEPS),0)
	@ echo "dependency checks skipped"
else #DEPS
	@ echo "checking dependencies:"
	@ for dep in $(alldeps) ;                                                                     \
	do                                                                                            \
	  printf "  $$dep - " ;                                                                       \
	  if [ $$(dpkg-query -W -f='$${Status}' $$dep 2>/dev/null | grep -c "ok installed") -eq 0 ] ; \
	  then                                                                                        \
	    missing="$$missing $$dep" ;                                                               \
	    echo "missing" ;                                                                          \
	  else                                                                                        \
	    echo "ok" ;                                                                               \
	  fi                                                                                          \
	done ;                                                                                        \
	if [ "x$$(echo "$$missing" | tr -d ' ')" != "x" ] ;                                           \
	then                                                                                          \
	  echo "You need to install the following package(s):" ;                                      \
	  echo "$$missing" ;                                                                          \
	  sudo -k apt-get -q install --no-install-recommends --no-install-suggests $$missing ;        \
	fi
	@ echo ""
endif #DEPS


source: download
	mkdir -p $(builddir)
	test -z "$(srcfiles)" || cp -r $(srcfiles) $(builddir)
	test ! -d debian || cp -rf debian $(builddir)
	@ if [ -f $(builddir)/debian/patches/series ] ;                               \
	then                                                                          \
	   rm -rf $(builddir)/.pc ;                                                   \
	   cd $(builddir) && QUILT_PATCHES=debian/patches quilt --quiltrc - push -a ; \
	fi
	rm -rf $(builddir)/.pc
	mkdir -p $(builddir)/debian/source
	echo '3.0 (native)' > $(builddir)/debian/source/format
	test -f $(builddir)/debian/compat || echo '$(default_compat)' > $(builddir)/debian/compat
	test -f $(builddir)/debian/source/options || \
	  (echo 'compression = "$(compression)"' > $(builddir)/debian/source/options && \
	   echo 'compression-level = "$(compression_level)"' >> $(builddir)/debian/source/options)


build: source
ifeq ($(PBUILDER),1)
	dpkg-source -Z$(compression) -z$(compression_level) -b $(builddir)
	@ $(create_basetgz)
	@# required for correct R/W rights
	mkdir -p $(resultdir)
	@# disable ".pbuilderrc does not exist" warning
	@ test -e "$$HOME/.pbuilderrc" || touch "$$HOME/.pbuilderrc"
	@ echo ""
	@ echo "sudo password required to run pbuilder:"
	@ echo "  $(pbuildercmd)"
	@ sudo -k $(TIME) $(pbuildercmd) *.dsc 2>&1 | tee $(LOG)
else #PBUILDER
ifneq ($(DEPS),0)
	@ cd $(builddir) ;                                                                                      \
	builddeps="`dpkg-checkbuilddeps 2>&1 | sed -e 's/dpkg-checkbuilddeps:.* Unmet build dependencies: //;'`"; \
	if [ $$(echo -n $$builddeps | wc -m) -gt 0 ] ;                                                          \
	then                                                                                                    \
	    echo "" ;                                                                                           \
	    echo "You need to install the following build dependencies:" ;                                      \
	    echo "$$builddeps" ;                                                                                \
	    echo "" ;                                                                                           \
	    sudo -k $(CURDIR)/../../mk/pbuilder-satisfydepends.sh ;                                             \
	fi
endif #DEPS
	cd $(builddir) && $(TIME) dpkg-buildpackage -j$(JOBS) -rfakeroot -b -us -uc 2>&1 | tee ../$(LOG)
	rm -f *.changes
	mkdir -p $(resultdir)
	mv *.deb $(resultdir)
endif #PBUILDER


	rm -f $(resultdir)/*.dsc
	rm -f $(resultdir)/*.changes
	rm -f $(resultdir)/*.tar.?z*


ifneq ($(SUMMARY),0)
	@ echo ""
	@ echo ""
	@ packages="$$(find "$(resultdir)" -maxdepth 1 -type f -name *.deb)" ; \
	if [ -n "$$packages" ] ;             \
	then                                 \
	    for f in $$packages ; do         \
	        echo "$$f:" ;                \
	        dpkg-deb -I $$f ;            \
	        echo "" ;                    \
	    done 2>&1 | tee -a $(LOG) ;      \
	    for f in $$packages ; do         \
	        echo "$$f:" ;                \
	        dpkg-deb -c $$f ;            \
	        echo "" ;                    \
	    done 2>&1 | tee -a $(LOG) ;      \
	    for f in $$packages ; do         \
	        echo "$$f:" ;                \
	        lintian $$f ;                \
	        echo "" ;                    \
	    done 2>&1 | tee -a $(LOG) ;      \
	fi
endif


	@ echo ""
	@ dummy_pkg_status=$$(dpkg-query -W -f='$${Status}' pbuilder-satisfydepends-dummy 2>/dev/null | grep -c "ok installed") ; \
	if [ $$dummy_pkg_status -ne 0 ] ;                                                    \
	then                                                                                 \
	    echo "Additional build dependencies have been installed." ;                      \
	    read -p "Do you want to remove them (recommended)? (Y/n) " REMOVE ;              \
	    if [ x$$REMOVE = xy ] || [ x$$REMOVE = xY ] || [ x$$REMOVE = x ] ;               \
	    then                                                                             \
	        sudo -k apt-get autoremove --purge pbuilder-satisfydepends-dummy ;           \
	    fi                                                                               \
	fi

