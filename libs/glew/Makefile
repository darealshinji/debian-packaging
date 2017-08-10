include ../../mk/include.mk

srcfiles       = extracted/*
cleanfiles     = extracted debian/control
bin            = $(glew_release).tgz
distcleanfiles = $(bin)
VERSION        = 1.0
changelog-msg  = Initial release

OLDVERSIONS = \
	1.0.7 \
	1.1.4 \
	1.2.5 \
	1.3.6 \
	1.4.0

VERSIONS = \
	1.5.8 \
	1.6.0 \
	1.7.0 \
	1.8.0 \
	1.9.0 \
	1.10.0 \
	1.11.0 \
	1.12.0 \
	1.13.0 \
	2.0.0 \
	2.1.0

glew_release  = glew-1.0.7-2.1.0
glew_checksum = 5a56a432c5cc7ef1096897345b509cdba40095226e6eea2a5dec75176690872c


debian/control:
	cp -f $@.in $@
	for n in $(shell seq 0 13); do \
  if [ $$n -ge 6 ]; then \
    section="libs"; \
  else \
    section="oldlibs"; \
  fi; \
  sed "s/@N@/$$n/; s/@SECTION@/$$section/;" $@.libglew1.in >> $@; \
  if [ $$n -ge 6 ]; then \
    sed "s/@N@/$$n/; s/@SECTION@/$$section/;" $@.libglewmx1.in >> $@; \
  fi; \
done
	for n in 0 1; do \
  sed "s/@N@/$$n/;" $@.libglew2.in >> $@; \
done

download: debian/control
	$(call download,$(bin),https://github.com/darealshinji/glew/releases/download/$(glew_release)/$(glew_release).tar.gz)
	$(call verifysha256,$(bin),$(glew_checksum))
	tar xvf $(bin)
	mv $(glew_release) extracted
	cd extracted && $(foreach VER,$(OLDVERSIONS),tar xf glew-$(VER).tgz && mv glew glew-$(VER) ;)
	cd extracted && $(foreach VER,$(VERSIONS),tar xf glew-$(VER).tgz ;)
	@ VERSION=$(VERSION); $(changelog-entry)

