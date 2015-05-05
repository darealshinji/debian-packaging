include ../../mk/include.mk

deps     = wget dh-autoreconf
bin      = fetch.tar.gz
builddir = fetch-master

download:
	@ $(call download,$(bin),https://github.com/darealshinji/fetch/archive/master.tar.gz)
	tar xvf $(bin)
	VERSION=`cat $(builddir)/source/VERSION`; $(changelog-entry)
