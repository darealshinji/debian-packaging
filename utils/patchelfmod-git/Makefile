include ../../Makefile.inc

deps = git dh-autoreconf
srcpkg = patchelfmod
builddir = $(srcpkg)
cleanfiles = $(builddir)
changelog-file = changelog.new

download:
	git clone "https://github.com/darealshinji/patchelfmod.git"

	mv $(builddir)/debian-upstream $(builddir)/debian
	mv $(builddir)/debian/changelog $(builddir)/debian/changelog.in
	latestcommit=$$(git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	VERSION=$$(cat $(builddir)/version | tr -d "\n")+git$$latestcommit ;\
	$(changelog-entry)

	cat changelog.new $(builddir)/debian/changelog.in > \
	$(builddir)/debian/changelog
	rm -rf $(builddir)/.git

