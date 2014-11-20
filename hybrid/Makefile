include ../Makefile.inc

deps = wget libqt4-dev
cleanfiles = hybrid-debian-master hybrid-avisynth-extension-master *.tar.gz


all: deps download build

nodeps: download build

build:
	tar xvf hybrid-debian.tar.gz
	tar xvf hybrid-avisynth-extension.tar.gz

	@cd hybrid-debian-master && \
	dpkg-buildpackage -b -us -uc 2>&1 | tee ../build.log

	@cd hybrid-avisynth-extension-master && \
dpkg-buildpackage -b -us -uc 2>&1 | tee -a ../build.log ;\
\
for f in ../*.deb ; do \
  echo "$$f:" ;\
  dpkg-deb -I $$f ;\
  lintian $$f ;\
  echo "" ;\
done 2>&1 | tee -a ../build.log ;\
\
for f in ../*.deb ; do \
  echo "$$f:" ;\
  dpkg-deb -c $$f ;\
  echo "" ;\
done 2>&1 | tee -a ../build.log

	mv -f *.deb *.changes ../

download: clean
	wget -O hybrid-debian.tar.gz "https://github.com/darealshinji/hybrid-debian/archive/master.tar.gz"
	wget -O hybrid-avisynth-extension.tar.gz "https://github.com/darealshinji/hybrid-avisynth-extension/archive/master.tar.gz"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

