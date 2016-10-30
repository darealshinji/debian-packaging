include ../../mk/include.mk

deps           = wget gnupg
srcfiles       = libpng*.tar.xz versions.txt
cleanfiles     = *.txt *.asc *.log *.tar.xz


# $(call download_png,VERSION,SOVERSION)
define download_png_
  test -f $(1) || \
  wget -q -O $(1) "https://sourceforge.net/projects/libpng/files/libpng$(2)/$(3)/$(1)/download"
endef
define download_png
  tarball=$$(echo libpng-$${version}.tar.xz); \
  echo "download and verify $${tarball}"; \
  $(call download_png_,$${tarball},$(2),$(1)); \
  $(call download_png_,$${tarball}.asc,$(2),$(1)); \
  if ! gpg --verify $${tarball}.asc $${tarball} 2> $${tarball}.asc.log; then \
    echo "ERROR:"; \
    cat $${tarball}.asc.log; \
    exit 1; \
  fi
endef

# signing key from https://pgp.mit.edu/pks/lookup?search=libpng&op=index
download: versions.txt
	gpg -q --import debian/upstream/signing-key.asc
	@ $(foreach SOVERSION,16 15 14 12,\
  version=$$(sed -n 's/libpng$(SOVERSION) //p' versions.txt); \
  $(call download_png,$$version,$(SOVERSION));)
	@ VERSION=0; $(changelog-entry)

versions.txt:
	@ echo "get library versions"
	@ versions=$$(wget -q -O- 'https://sourceforge.net/p/libpng/code/ref/master/tags/' | \
  sed -n 's,.*<a[^>]*>v\([0-9][^<]*\)<.*,\1,p' | \
  grep -v  -e alpha  -e beta  -e rc  -e pre  -e master); \
  for n in 1.6 1.5 1.4 1.2; do \
    ver=$$(echo $$versions | tr ' ' '\n' | grep "^$$n" | sort -V | tail -1); \
    echo "libpng`echo $$ver | cut -d'.' -f1,2 | tr -d '.'` $$ver" >> $@; \
  done;

