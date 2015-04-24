include ../../mk/include.mk

srcfiles       = glew-1.*.0 glew-1.5.8 glew-1.3.6 glew-1.2.5 glew-1.1.4 glew-1.0.7
cleanfiles     = $(srcfiles) debian/control
distcleanfiles = *.tgz

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
	1.12.0

URL = http://downloads.sourceforge.net/project/glew/glew

debian/control:
	cp -f $@.in $@
	for n in $(shell seq 0 12); do \
  if [ $$n -ge 6 ]; then \
    section="libs"; \
  else \
    section="oldlibs"; \
  fi; \
  sed "s/@N@/$$n/; s/@SECTION@/$$section/;" $@.template >> $@; \
done

download: debian/control
	$(foreach VER, $(OLDVERSIONS),\
	  $(call download,glew-$(VER).tgz,$(URL)/$(VER)/glew-$(VER)-src.tgz?r) ;\
	  tar xf glew-$(VER).tgz ;\
	  mv glew glew-$(VER) ;\
	 )
	$(foreach VER, $(VERSIONS),\
	  $(call download,glew-$(VER).tgz,$(URL)/$(VER)/glew-$(VER).tgz?r) ;\
	  tar xf glew-$(VER).tgz ;\
	 )

