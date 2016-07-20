include ../../mk/include.mk

deps           = wget
bin            = p7zip.tbz
srcfiles       = p7zip_$(VER)/*
cleanfiles     = p7zip_$(VER)
distcleanfiles = $(bin)
changelog-msg  = New upstream release

VER = 16.02
sha256 = 5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f


download:
	@ $(call download,$(bin),https://sourceforge.net/projects/p7zip/files/p7zip/$(VER)/p7zip_$(VER)_src_all.tar.bz2)
	@ $(call verifysha256,$(bin),$(sha256))
	tar xvf $(bin)
	@ VERSION=$(VER); $(changelog-entry)

