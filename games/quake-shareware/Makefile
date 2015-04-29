include ../../mk/include.mk

deps           = wget
bin            = quake106.zip
srcfiles       = $(bin) *.png
distcleanfiles = $(bin) *.png

download:
	@ $(call download,$(bin),http://www.moddb.com/downloads/mirror/14692/113/c21ab0711bc10c02d41422e9e0b2ef56)
	@ $(call download,quake-shareware.png,http://fs2.directupload.net/images/150429/wu5h5c3y.png)
	@ $(call verifysha256,$(bin),ec6c9d34b1ae0252ac0066045b6611a7919c2a0d78a3a66d9387a8f597553239)
	@ $(call verifysha256,quake-shareware.png,21382cdf2d4761500f9dbfd1f6d16d45b831291eb799836d9da6ae7bde979b70)

