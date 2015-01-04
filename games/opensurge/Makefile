include ../../include.mk

deps       = wget
URL        = http://www.ime.usp.br/~alemart/opensurge_nightly/
VERSION    = $(shell wget -q -O - $(URL) | grep 'GAME VERSION:' | cut -d '>' -f5 | cut -d' ' -f1)
REVISION   = $(shell wget -q -O - $(URL) | grep 'SVN REVISION:' | cut -d '>' -f5 | cut -d' ' -f1 | sed 's@</td@@')
bin        = $(shell wget -q -O - $(URL) | grep 'Source code:'  | cut -d '>' -f3 | sed 's@</a@@')
builddir   = $(shell echo $(bin) | sed 's/.tar.gz//')
srcfiles   = opensurge.png alfont
cleanfiles = $(srcfiles)

download:
	wget "$(URL)$(bin)"
	wget "https://github.com/darealshinji/modified-alfont209/archive/master.tar.gz"
	wget -O opensurge.png "http://fs2.directupload.net/images/150104/y5nc4fwi.png"
	tar xvf $(bin)
	tar xfv master.tar.gz
	mv modified-alfont209-master alfont
	@ VERSION=$(VERSION)~svn$(REVISION); $(changelog-entry)
