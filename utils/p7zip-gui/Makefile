include ../../mk/include.mk

deps          = wget
srcfiles      = p7zip_$(VER)/*
cleanfiles    = p7zip_$(VER)
changelog-msg = New upstream release

VER = 15.09
sha256 = 8783acf747e210e00150f7311cc06c4cd8ecf7b0c27b4adf2194284cc49b4d6f


download:
	@ $(call download,p7zip.tar.bz2,http://downloads.sourceforge.net/project/p7zip/p7zip/$(VER)/p7zip_$(VER)_src_all.tar.bz2?r)
	@ $(call verifysha256,p7zip.tar.bz2,$(sha256))
	tar xvf p7zip.tar.bz2
	@ VERSION=$(VER); $(changelog-entry)

