include ../../mk/include.mk

deps           = wget
bin            = am2r_demo.tgz
distcleanfiles = $(bin)
srcfiles       = $(bin)

ID = s5khepcc4d1ezfc/am2r_demo141.tar.gz
sha256sum = 5aafc0746a78510b7fd568fa982358ecbd7f1a47fcdfcf7b9779444e2b6576dd

URL = $(shell wget -q -O - "http://www.mediafire.com/download/$(ID)" | grep 'kNO = "http://download.*\.mediafire\.com/.*/$(ID)";' | cut -d '"' -f2)


download:
	@ $(call download,$(bin),$(URL))
	@ $(call verifysha256,$(bin),$(sha256sum))

