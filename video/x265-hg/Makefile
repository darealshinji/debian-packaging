include ../../mk/include.mk

deps           = wget
bin            = x265.tar.bz2
builddir       = x265-source
cleanfiles     = $(bin) debian/changelog
changelog-file = debian/changelog
changelog-msg  = Current snapshot

download:
	wget -O $(bin) "https://bitbucket.org/multicoreware/x265/get/tip.tar.bz2"
	tar xvf $(bin)
	mv multicoreware-x265-* $(builddir)
	@ latesttag=`grep 'latesttag:' $(builddir)/.hg_archival.txt|cut -d' ' -f2` ;\
	latesttagdistance=`grep 'latesttagdistance:' $(builddir)/.hg_archival.txt|cut -d' ' -f2` ;\
	node=`grep 'node:' $(builddir)/.hg_archival.txt|cut -d' ' -f2|head -c16` ;\
	VERSION=$${latesttag}+$${latesttagdistance}+hg$${node} ;\
	$(changelog-entry)

