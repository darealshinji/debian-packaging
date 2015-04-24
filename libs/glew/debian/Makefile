all: control

control:
	cp -f $@.in $@
	for n in $(shell seq 0 12); do \
  if [ $$n -ge 6 ]; then \
    section="libs"; \
  else \
    section="oldlibs"; \
  fi; \
  sed "s/@N@/$$n/; s/@SECTION@/$$section/;" $@.template >> $@; \
done
