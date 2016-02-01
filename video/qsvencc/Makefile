include ../../mk/include.mk

deps           = wget p7zip

VERSION        = 2.28
url            = https://dropbox.com/s/3vse3uzf4xujtd0/QSVEnc_$(VERSION)_7zip.7z
sha256sum      = a851b80862bf992981a23b6bfc2a506cfe433ccb087a2214afccadda27501f29

srcfiles       = QSVEnc/*
bin            = QSVEnc_$(VERSION)_7zip.7z
cleanfiles     = QSVEnc_$(VERSION) QSVEnc tmp.7z
distcleanfiles = $(bin)
changelog-msg  = New release version


download:
	@ $(call download,$(bin),$(url))
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)
	rm -rf $(cleanfiles)
	cp -f $(bin) tmp.7z
	p7zip -d tmp.7z && rm -f tmp.7z
	p7zip -d QSVEnc_$(VERSION)/QSVEnc_src.7z && rm -rf QSVEnc_$(VERSION)
	chmod a+x QSVEnc/configure

