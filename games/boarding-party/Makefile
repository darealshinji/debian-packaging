include ../../mk/include.mk

deps           = wget
bin            = boarding-party.jar
cleanfiles     = *.png
distcleanfiles = $(bin)
srcfiles       = $(bin) boarding-party.png

download:
	test -f $(bin) || wget "http://www.intrrpt.com/downloads/boarding-party.jar"
	# mirror: http://www.mediafire.com/download/u6022kzu5vp2mz3/boarding-party.jar
	@$(call verifysha256,$(bin),6c7fdc04102ee6f66bb5b6a2d7176ccbddd089b00e99b522f781dbd5ff7fcb82)
	wget -O boarding-party.png "http://fs2.directupload.net/images/150127/3c9odqol.png"

