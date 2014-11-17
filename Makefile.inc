export LANG=C
export LANGUAGE=C
export LC_ALL=C

buildpackage = \
@dpkg-buildpackage -b -us -uc 2>&1 | tee build.log ;\
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
