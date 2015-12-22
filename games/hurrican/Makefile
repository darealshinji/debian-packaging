include ../../mk/include.mk

deps           = subversion
builddir       = hurrican-trunk
srcfiles       = ../../mk/make-icons.sh
distcleanfiles = $(builddir)-backup
changelog-msg  = Current development snapshot


download:
	if [ -d $(builddir)-backup ]; then \
	  rm -rf $(builddir) && cp -lr $(builddir)-backup $(builddir) ;\
	else \
	  svn co svn://svn.code.sf.net/p/hurrican/code/trunk/Hurrican $(builddir) && \
	  cd $(builddir); \
	  svn info . | grep '^Revision:' | cut -d' ' -f2 > svn-revision ;\
	  rm -rf .svn data/pvr data/textures/pvr lang/languages.zip ;\
	  find . -type f -name \*.exe -exec rm -f '{}' \; ;\
	  find . -type f -name \*.dll -exec rm -f '{}' \; ;\
	  find . -type f -exec chmod a-x '{}' \; ;\
	  cd .. && cp -lr $(builddir) $(builddir)-backup ;\
	fi
	@ VERSION="0.0.$$(cat $(builddir)/svn-revision)"; $(changelog-entry)

