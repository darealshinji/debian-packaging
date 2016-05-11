include ../../mk/include.mk

deps       = subversion wget
builddir   = eduke32
srcfiles   = eduke32.png ../../mk/make-icons.sh
cleanfiles = eduke32.png

download: $(builddir)/EDUKE32_REVISION
	@ VERSION="2.0.0~svn$$(cat $<)"; $(changelog-entry)
	@ $(call download,eduke32.png,http://fs5.directupload.net/images/160511/c289smoz.png)
	@ $(call verifysha256,eduke32.png,b0ecff75a9336192375602c163a2b7727c1cf5b5ce23c70d2f640689e4bf037d)

$(builddir)/EDUKE32_REVISION:
	svn checkout "http://svn.eduke32.com/eduke32/polymer/eduke32" $(builddir)
	cd $(builddir) && svn info 2>&1 | grep Revision | cut -d' ' -f2 > EDUKE32_REVISION
	cd $(builddir) && rm -rf .svn package platform rsrc/source

