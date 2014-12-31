include ../../include.mk

deps = mercurial
srcfiles = source
cleanfiles = $(srcfiles) $(changelog-file)
changelog-file = debian/changelog
changelog-msg = Current snapshot
srcpkg = x265

download:
	hg clone "https://bitbucket.org/multicoreware/x265" source
	cd source && hg log --style changelog > ChangeLog

	VERSION=$$(cd source && hg parents --template '{latesttag}+{latesttagdistance}+hg{node|short}') ;\
	$(changelog-entry)

	rm -rf source/.hg

