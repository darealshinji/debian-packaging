include ../../mk/include.mk

deps     = wget
bin      = fetch.tar.gz
builddir = fetch-master

download:
ifeq ($(PBUILDER),0)
	@ echo "fetch won't build without pbuilder."
	@ echo "Run make without \`PBUILDER=0'"
	@ echo ""
	@ exit 1
else
	@ $(call download,$(bin),https://github.com/darealshinji/fetch/archive/master.tar.gz)
	tar xvf $(bin)
	VERSION=`cat $(builddir)/source/VERSION`; $(changelog-entry)
endif
