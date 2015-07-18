include ../../mk/include.mk

deps       = git dh-autoreconf
builddir   = libdvdcss
cleanfiles = debian/changelog

download:
	git clone --depth 1 "git://git.videolan.org/libdvdcss"
	@ VERSION=`./changelog.sh`; $(changelog-entry)
	rm -rf $(builddir)/.git
	touch $(builddir)/ChangeLog

