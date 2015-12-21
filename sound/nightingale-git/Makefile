include ../../mk/include.mk

deps           = git
ngdir          = nightingale-hacking
srcfiles       = $(ngdir)/*
cleanfiles     = minimizetotrayplus nightingale-deps
distcleanfiles = $(ngdir)
changelog-file = $(ngdir)/changelog.new


download:
	test -d $(ngdir) || ./download.sh
	@ VERSION="$$(cat $(ngdir)/VERSION)-1"; $(changelog-entry)
	mkdir -p $(ngdir)/debian
	cat $(ngdir)/changelog.new $(ngdir)/changelog.in > $(ngdir)/debian/changelog

