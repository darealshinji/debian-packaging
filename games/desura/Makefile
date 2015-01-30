include ../../mk/include.mk

ARCH           = amd64
deps           = wget
bin            = desura.tgz
srcfiles       = $(bin)
distcleanfiles = $(bin)

download:
	test -f $(bin) || (wget -O $(bin) "http://www.desura.com/desura-x86_64.tar.gz" && mv desura-x86_64.tar.gz $(bin))

