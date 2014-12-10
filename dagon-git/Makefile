include ../Makefile.inc

deps = git
cleanfiles = Dagon debian/changelog
srcfiles = Dagon

download:
	git clone "https://github.com/Senscape/Dagon.git"
	./changelog.sh
	rm -rf Dagon/extlibs Dagon/.git

