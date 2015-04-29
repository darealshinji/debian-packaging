include ../../mk/include.mk

deps           = wget unzip
dir            = 3dduke13
bin            = $(dir).zip
cleanfiles     = $(dir) debian/copyright
distcleanfiles = $(bin)
srcfiles       = $(dir)/DN3DSW13/DUKE3D.GRP

download:
	@ $(call download,$(bin),http://www.moddb.com/downloads/mirror/14732/102/836e28a052f1e3da7d0b88777bf9897d)
	@ $(call verifysha256,$(bin),c67efd179022bc6d9bde54f404c707cbcbdc15423c20be72e277bc2bdddf3d0e)
	unzip -d $(dir) $(bin)
	unzip -d $(dir)/DN3DSW13 $(dir)/DN3DSW13.SHR
	iconv -f ISO-8859-1 -t UTF-8 $(dir)/LICENSE.TXT > debian/copyright

