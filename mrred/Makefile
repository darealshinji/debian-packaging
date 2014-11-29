include ../Makefile.inc

deps = imagemagick wget
bin = mrred.tar.gz
cleanfiles = $(bin) mrred.png assets runner converted_icons
sha256_1 = ae0164bfc842a409016518985f8e1f11e07d4730209eb891a36d04135e283049
URL = "https://www.dropbox.com/s/z8b534gi6xxhgki/Mr%20Reds%20Adventure%20TMB.tar.gz?dl=1"

download: clean
	wget -O $(bin) $(URL)
	@ $(verifysha256)
	wget -O mrred.png "http://s14.directupload.net/images/140508/oslo47cn.png"
	tar xzvf $(bin)

