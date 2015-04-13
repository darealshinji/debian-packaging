include ../../mk/include.mk

deps           = wget
bin            = thunderbird.tbz
srcfiles       = $(bin)
distcleanfiles = $(bin) VERSION debian/control
changelog-msg  = New release version


download:
	@ test -f $(bin) || ./download.sh
	@ VERSION=`cat VERSION` ; $(changelog-entry)

