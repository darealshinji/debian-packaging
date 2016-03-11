include ../../mk/include.mk

deps           = wget
cleanfiles     = *.png
bin            = doom3-linux-1.1.1286-demo.x86.run
icon           = doom3-demo.png
distcleanfiles = $(bin)
srcfiles       = $(bin) $(icon) ../../mk/make-icons.sh

download:
	@ $(call download,$(bin),ftp://ftp.fu-berlin.de/pc/games/idgames/idstuff/doom3/linux/$(bin))
	@ $(call download,$(icon),http://s14.directupload.net/images/141118/83e95wug.png)
	@ $(call verifysha256,$(bin),b42260fd08feb13c2f035a3746f8c1e3472151f0f781b8a2d1da231dae818083)
	@ $(call verifysha256,$(icon),25c422e71fabdc875d97e5004dd7251d96762df79540324db0da69f44d3f1762)

