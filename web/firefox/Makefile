include ../../mk/include.mk

deps           = wget
bin            = firefox.tbz
srcfiles       = $(bin)
distcleanfiles = $(bin) VERSION
changelog-msg  = New release version


download:
	@ test -f $(bin) || ./download.sh
	@ VERSION=`cat VERSION` ; $(changelog-entry)

