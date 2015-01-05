include ../../mk/include.mk

deps       = wget
cleanfiles = hybrid*
LOG        = hybrid-build.log

download:
	wget -O hybrid-debian.tar.gz \
	"https://github.com/darealshinji/hybrid-debian/archive/master.tar.gz"
	wget -O hybrid-avisynth-extension.tar.gz \
	"https://github.com/darealshinji/hybrid-avisynth-extension/archive/master.tar.gz"
	tar xvf hybrid-debian.tar.gz
	tar xvf hybrid-avisynth-extension.tar.gz

pbuilder:
	dpkg-source -b hybrid-debian-master
	dpkg-source -b hybrid-avisynth-extension-master
	sudo pbuilder build hybrid_*.dsc 2>&1 | tee ../$(LOG)
	sudo pbuilder build hybrid-avisynth-extension_*.dsc 2>&1 | tee -a ../$(LOG)
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

