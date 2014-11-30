export LANG=C
export LANGUAGE=C
export LC_ALL=C

builddir = .

buildpackage = \
dpkg-buildpackage -b -us -uc 2>&1 | tee build.log ;\
\
for f in ../*.deb ; do \
  echo "$$f:" ;\
  dpkg-deb -I $$f ;\
  lintian $$f ;\
  echo "" ;\
done 2>&1 | tee -a build.log ;\
\
for f in ../*.deb ; do \
  echo "$$f:" ;\
  dpkg-deb -c $$f ;\
  echo "" ;\
done 2>&1 | tee -a build.log

verifysha256 = \
@sha256_2=$$(sha256sum $(bin) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(bin):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$(bin)' and try it again." ;\
    exit 1 ;\
fi


all: deps download build

nodeps: download build

build-default:
	@ cd $(builddir) && $(buildpackage)
	@ test "$(builddir)" = "." && true || \
	(mv -f $(builddir)/build.log . ; mv -f *.deb *.changes ../)

deps:
	test -f dependencies.sh && ./dependencies.sh || \
	sudo apt-get install debhelper $(deps)

clean:
	test -f debian/control && dh_clean || true
	test -f debian/control && debian/rules override_dh_auto_clean || true
	rm -rf .pc build.log changelog.new *.deb *.changes converted_icons tmp temp $(cleanfiles)

