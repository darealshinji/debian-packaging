include ../../mk/include.mk

deps           = wget unzip
bin            = FLVExtractCL.zip
distcleanfiles = $(bin)


download:
	@ $(call download,$(bin),https://github.com/darealshinji/Moitah.net/releases/download/2014.10.23/$(bin))
	unzip -d $(builddir) $(bin)
	rm $(builddir)/Makefile

