include ../../mk/include.mk

deps       = git
cleanfiles = Dagon
builddir   = Dagon

download:
	git clone "https://github.com/Senscape/Dagon.git"
	VERSION=`./changelog.sh` ; $(changelog-entry)
	rm -rf Dagon/extlibs Dagon/.git

