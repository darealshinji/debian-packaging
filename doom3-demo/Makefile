include ../Makefile.inc

deps = wget
cleanfiles = *.png
distcleanfiles = $(bin)
srcfiles = doom3-demo.png $(bin)

sha256_1 = b42260fd08feb13c2f035a3746f8c1e3472151f0f781b8a2d1da231dae818083
bin = doom3-linux-1.1.1286-demo.x86.run

download:
	test -f $(bin) || wget "ftp://ftp.fu-berlin.de/pc/games/idgames/idstuff/doom3/linux/$(bin)"
	@ $(verifysha256)
	wget -O doom3-demo.png "http://s14.directupload.net/images/141118/83e95wug.png"

