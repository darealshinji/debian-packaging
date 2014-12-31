include ../../include.mk

deps = git
cleanfiles = freedoom debian/changelog
srcfiles = freedoom files

download:
	git clone "https://github.com/freedoom/freedoom.git"
	./changelog.sh
	rm -rf freedoom/.git

