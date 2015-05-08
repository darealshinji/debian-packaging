include ../../mk/include.mk

deps       = git
builddir   = freedoom
cleanfiles = debian/changelog
srcfiles   = $(builddir) files

download:
	rm -rf $(builddir)
	git clone "https://github.com/freedoom/freedoom.git"
	@ VERSION=`./changelog.sh`; $(changelog-entry)
	rm -rf $(builddir)/.git

