export LANG=C
export LANGUAGE=C
export LC_ALL=C

builddir = pbuilder-source
LOG = ../$(shell basename $$PWD)-build.log
resultdir = /var/cache/pbuilder/result

define verifysha256
    sha256_2=$$(sha256sum $(1) | head -c64) ;\
    if [ $$sha256_2 != $(2) ] ; then \
        echo "$(1):" ;\
        echo "SHA256 checksum is $$sha256_2 but should be $(2)." ;\
        echo "Delete '$(1)' and try it again." ;\
        exit 1 ;\
    else \
        echo "$(1): checksum ok." ;\
    fi
endef

MAINTAINER = Marshall Banana <djcj@gmx.de>
changelog-msg = Current git snapshot
changelog-file = $(builddir)/debian/changelog
changelog-entry = \
mkdir -p $(shell dirname $(changelog-file)) ;\
echo "$(srcpkg) ($${VERSION}) unstable; urgency=low" > $(changelog-file) ;\
echo ""                                             >> $(changelog-file) ;\
echo "  * $(changelog-msg)"                         >> $(changelog-file) ;\
echo ""                                             >> $(changelog-file) ;\
echo " -- $(MAINTAINER)  `date -R`"                 >> $(changelog-file) ;\
echo ""                                             >> $(changelog-file)

allcleanfiles = \
.pc $(LOG) changelog.new converted_icons tmp temp *.dsc \
*.tar.gz *.tar.bz2 *.tar.xz $(builddir) $(cleanfiles)

alldeps = debhelper pbuilder quilt $(deps)


all: clean predepends download source pbuilder

nodeps: clean download source pbuilder

clean:
	rm -rf $(allcleanfiles)

distclean:
	rm -rf $(distcleanfiles) $(allcleanfiles)

predepends:
	@ echo ""
	@ echo "checking dependencies:"
	@ $(foreach DEP, $(alldeps), \
	echo $(DEP); \
	if [ "$$(aptitude show $(DEP) | grep -e 'State:' | sed -e 's/State: //;')" = 'not installed' ] ;\
	then \
	    echo "You need to install the package '$(DEP)'" ;\
	    sudo apt-get install $(DEP) ;\
	fi ;)
	@ echo ""

source: download
	mkdir -p $(builddir)
	cp -r ../make-icons.sh $(srcfiles) $(builddir)
	test -d debian && cp -fr debian $(builddir) || true

pbuilder: source
	rm -rf .pc
	if [ -f $(builddir)/debian/patches/series ] ; then \
   cd $(builddir) && QUILT_PATCHES=debian/patches quilt push -a ;\
   rm -rf $(builddir)/.pc ;\
fi
	echo '3.0 (native)' > $(builddir)/debian/source/format
	dpkg-source -b $(builddir)

	@ if [ ! -f "/var/cache/pbuilder/base.tgz" ] ; then \
	    echo "" ;\
	    echo "sudo password required to create base.tgz:" ;\
	    sudo pbuilder --create \
	         --components "main restricted universe multiverse" \
		 --debootstrapopts --variant=buildd ;\
	fi

	@ echo ""
	@ echo "sudo password required to run pbuilder:"
	@ sudo pbuilder --build *.dsc 2>&1 | tee $(LOG)

	@ for f in $(resultdir)/*.deb ; do \
  echo "$$f:" ;\
  dpkg-deb -I $$f ;\
  lintian $$f ;\
  echo "" ;\
done 2>&1 | tee -a $(LOG) ;\
\
for f in $(resultdir)/*.deb ; do \
  echo "$$f:" ;\
  dpkg-deb -c $$f ;\
  echo "" ;\
done 2>&1 | tee -a $(LOG)

