include ../../mk/include.mk

deps       = git
cleanfiles = Dagon
builddir   = Dagon

download:
	rm -rf $(builddir)
	git clone "https://github.com/Senscape/Dagon.git"
	@ VERSION=`./changelog.sh` ; $(changelog-entry)
	rm -rf $(builddir)/extlibs $(builddir)/.git

