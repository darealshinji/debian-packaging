include ../../mk/include.mk

deps           = wget
bin            = firefox.tbz
srcfiles       = $(bin)
distcleanfiles = $(bin)

download:
	@ test -f $(bin) || ./download.sh

