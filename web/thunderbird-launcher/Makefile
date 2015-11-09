include ../../mk/include.mk

deps           = wget
bin            = thunderbird.tbz
srcfiles       = $(bin)
distcleanfiles = $(bin)

download:
	@ test -f $(bin) || ./download.sh

