include ../../mk/include.mk

deps           = wget
bin            = google-chrome-deb.bin
key            = linux_signing_key.pub
srcfiles       = $(bin) $(key)
distcleanfiles = $(bin) $(key)
changelog-msg  = New release version


download:
	@ $(call download,$(bin),https://dl.google.com/linux/direct/google-chrome-stable_current_$(ARCH).deb)
	@ $(call download,$(key),https://dl.google.com/linux/$(key))
	@ VERSION="`dpkg-deb -I $(bin) | grep 'Version:' | cut -d' ' -f3`repack1" ; $(changelog-entry)

