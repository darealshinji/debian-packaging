include ../../mk/include.mk

deps       = git dh-autoreconf
builddir   = libdvdcss
cleanfiles = debian/changelog


download:
	git clone --depth 1 "git://git.videolan.org/libdvdcss"

	@ stablever="$$(wget -q -O - http://download.videolan.org/pub/debian/unstable/Sources | \
	  grep -e '^Version: ' | sed 's|Version: ||;' | cut -d- -f1)"; \
	$(foreach VER,major minor micro,\
	  git_$(VER)="$$(grep '^m4_define(\[dvdcss_$(VER)\],' $(builddir)/configure.ac | cut -d, -f2 | sed 's|)||g; s| ||g')";) \
	gitver="$${git_major}.$${git_minor}.$${git_micro}"; \
	latestcommit="$$(git -C $(builddir) log -1 --format=%ci | head -c10 | sed 's|-||g')"; \
	test "$$stablever" = "$$gitver" && git="+git" || git="~git"; \
	VERSION="$${gitver}$${git}$${latestcommit}"; $(changelog-entry)

	rm -rf $(builddir)/.git
	touch $(builddir)/ChangeLog

