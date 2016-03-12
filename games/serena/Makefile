include ../../mk/include.mk

deps           = wget unzip
cleanfiles     = Serena *.txt *.png
distcleanfiles = $(bin)
srcfiles       = Serena *.png ../../mk/make-icons.sh
bin            = serena.zip
icon           = serena.png

download:
	@ $(call download,$(bin),http://www.indiedb.com/downloads/mirror/65077/114/167b5e14ce7b4073f13bbecd90bd064a)
	@ $(call download,$(icon),http://s14.directupload.net/images/141116/9yoas6gx.png)
	@ $(call verifysha256,$(bin),b25bbabad910db78c9446e2d293eb161588a7b2098713e77a512f8c10345f530)
	@ $(call verifysha256,$(icon),a96e418a64d9c21c5982c17b48c48df1be789b8de8a1d9ffa4dda3cf5d14b705)
	unzip $(bin)
