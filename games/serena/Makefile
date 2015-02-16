include ../../mk/include.mk

deps           = wget unzip
cleanfiles     = Serena *.txt *.png
distcleanfiles = $(bin)
srcfiles       = Serena files *.png
bin            = serena.zip

download:
	test -f $(bin) || wget -O $(bin) "http://www.indiedb.com/downloads/mirror/65077/108/9cdc8ece6879b7681359647df927b5fb"
	@$(call verifysha256,$(bin),b25bbabad910db78c9446e2d293eb161588a7b2098713e77a512f8c10345f530)
	wget -O serena.png "http://s14.directupload.net/images/141116/9yoas6gx.png"
	unzip $(bin)
