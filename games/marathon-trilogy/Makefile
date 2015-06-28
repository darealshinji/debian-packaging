include ../../mk/include.mk

deps           = subversion wget
builddir       = marathon-code
srcfiles       = *.pdf
distcleanfiles = $(srcfiles) $(builddir)-backup

URL = http://archives2.bungie.org/manuals

mpdfsum  = aab85b1e9fbc0eafdf6f8cf533ead1ee506a3e582fce260ac25c6a2f02a739d3
m2pdfsum = 7a83e14c70a8783b55297f9b19bb3be59cba0c555298c318a122083923f07846
mipdfsum = d24dc8e955d7c3705e21d050d18ec342e2eae8e38c6fa481ad8bd76b5eab58ca

M = Marathon


download:
	@ $(call download,$(M)_Manual.pdf,$(URL)/$(M)_Manual.pdf)
	@ $(call download,$(M)_2_Manual.pdf,$(URL)/$(M)_2_Manual.pdf)
	@ $(call download,$(M)_Infinity_Manual.pdf,$(URL)/Trilogy_Manual.pdf)
	@ $(call verifysha256,$(M)_Manual.pdf,$(mpdfsum))
	@ $(call verifysha256,$(M)_2_Manual.pdf,$(m2pdfsum))
	@ $(call verifysha256,$(M)_Infinity_Manual.pdf,$(mipdfsum))

	@ if [ -d $(builddir)-backup ]; then \
		echo "copy backup files"; \
		cp -r $(builddir)-backup $(builddir); \
	else \
		svn checkout "svn://svn.code.sf.net/p/marathon/code/scenarios" $(builddir); \
		svn info $(builddir) | grep 'Rev:' | cut -d' ' -f4 > $(builddir)/REVISION; \
		rm -rf $(builddir)/.svn $(builddir)/M1A1 $(builddir)/XBLA_HUD; \
		mv '$(builddir)/$(M) 2' $(builddir)/$(M)-2; \
		mv '$(builddir)/$(M) Infinity' $(builddir)/$(M)-Infinity; \
		echo "create backup"; \
		cp -r $(builddir) $(builddir)-backup; \
	fi
	@ VERSION=1+svn`cat $(builddir)/REVISION`; $(changelog-entry)

