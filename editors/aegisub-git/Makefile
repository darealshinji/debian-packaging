include ../../mk/include.mk

deps       = git
builddir   = Aegisub
cleanfiles = debian/changelog

download: $(builddir)

$(builddir):
	git clone "https://github.com/Aegisub/Aegisub.git"
	cd $@ && bash build/version.sh .
	#rm -rf $@/.git
	@ VERSION="$$(grep -e 'BUILD_GIT_VERSION_STRING' $@/build/git_version.h | cut -d'"' -f2)"; \
	$(changelog-entry)

