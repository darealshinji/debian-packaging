include ../../mk/include.mk

deps     = git
builddir = RBDOOM-3-BFG

download:
	git clone --depth 1 "https://github.com/RobertBeckebans/RBDOOM-3-BFG.git"
	@ latestcommit=`git -C $(builddir)/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')` ;\
	VERSION="1.0.2.1400+git$${latestcommit}"; $(changelog-entry)
	rm -rf $(builddir)/.git $(builddir)/neo/libs/ffmpeg-win* $(builddir)/neo/astyle.x86*
	find $(builddir) -name *.exe -delete
	find $(builddir) -name *.dll -delete
	find $(builddir) -name *.a -delete
	find $(builddir) -name *.lib -delete
	find $(builddir) -name *.so -delete
	find $(builddir) -name *.o -delete

