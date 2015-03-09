include ../../mk/include.mk

deps           = wget
bin            = boarding-party.jar
cleanfiles     = *.png
distcleanfiles = $(bin)
srcfiles       = $(bin) boarding-party.png

download:
	test -f $(bin) || wget "http://download939.mediafire.com/7db1zk7f8d3g/u6022kzu5vp2mz3/$(bin)"
	@$(call verifysha256,$(bin),6c7fdc04102ee6f66bb5b6a2d7176ccbddd089b00e99b522f781dbd5ff7fcb82)
	wget -O boarding-party.png "http://fs2.directupload.net/images/150127/3c9odqol.png"

