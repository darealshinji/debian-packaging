include ../../mk/include.mk

deps          = wget
bin           = x265.tar.bz2
builddir      = x265-source
cleanfiles    = $(bin)
changelog-msg = Current snapshot

download:
	@ $(call download,$(bin),https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2)
	tar xvf $(bin)
	mv multicoreware-x265-* $(builddir)
	@ latesttag=`grep '^latesttag:' $(builddir)/.hg_archival.txt|cut -d' ' -f2` ;\
	latesttagdistance=`grep '^latesttagdistance:' $(builddir)/.hg_archival.txt|cut -d' ' -f2` ;\
	VERSION=$${latesttag}+$${latesttagdistance} ; $(changelog-entry)
