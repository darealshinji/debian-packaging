include ../../mk/include.mk

deps       = git dh-autoreconf
builddir   = libdvdcss
cleanfiles = debian/changelog


download:
	git clone --depth 1 "http://code.videolan.org/videolan/libdvdcss.git"

	@ $(foreach VER,major minor micro,\
	  $(VER)="$$(grep '^m4_define(\[dvdcss_$(VER)\],' $(builddir)/configure.ac | cut -d, -f2 | sed 's|)||g; s| ||g')";) \
	latestcommit="$$(git -C $(builddir) log -1 --format=%ci | head -c10 | sed 's|-||g')"; \
	VERSION="$${major}.$${minor}.$${micro}+git$${latestcommit}"; $(changelog-entry)

	rm -rf $(builddir)/.git
	touch $(builddir)/ChangeLog

