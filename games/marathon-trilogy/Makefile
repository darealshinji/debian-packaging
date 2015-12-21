include ../../mk/include.mk

deps           = git wget
builddir       = marathon
srcfiles       = *.pdf ../../mk/make-icons.sh
distcleanfiles = *.pdf $(builddir)-backup

mpdfsum  = aab85b1e9fbc0eafdf6f8cf533ead1ee506a3e582fce260ac25c6a2f02a739d3
m2pdfsum = 7a83e14c70a8783b55297f9b19bb3be59cba0c555298c318a122083923f07846
mipdfsum = d24dc8e955d7c3705e21d050d18ec342e2eae8e38c6fa481ad8bd76b5eab58ca

M = Marathon
m = marathon

url = http://archives2.bungie.org/manuals
gitclone = git clone --depth 1 https://github.com/Aleph-One-Marathon/data-marathon
log = log -1 --format=%ci | head -c10 | sed -e 's/-//g'


download:
	@ $(call download,$(M)_Manual.pdf,$(url)/$(M)_Manual.pdf)
	@ $(call download,$(M)_2_Manual.pdf,$(url)/$(M)_2_Manual.pdf)
	@ $(call download,$(M)_Infinity_Manual.pdf,$(url)/Trilogy_Manual.pdf)
	@ $(call verifysha256,$(M)_Manual.pdf,$(mpdfsum))
	@ $(call verifysha256,$(M)_2_Manual.pdf,$(m2pdfsum))
	@ $(call verifysha256,$(M)_Infinity_Manual.pdf,$(mipdfsum))

	if [ ! -d $(m) ]; then \
		if [ -d $(m)-backup ]; then \
			cp -rl $(m)-backup $(m) ;\
		else \
			$(gitclone) $(m)/$(m) ;\
			$(gitclone)-2 $(m)/$(m)-2 ;\
			$(gitclone)-infinity $(m)/$(m)-infinity ;\
			rm -rf $(m)/$(m)/.git $(m)/$(m)-2/.git $(m)/$(m)-infinity/.git ;\
			cp -rl $(m) $(m)-backup ;\
		fi ;\
	fi

	@ d1=`git -C $(m)/$(m) $(log)` ;\
	d2=`git -C $(m)/$(m)-2 $(log)` ;\
	d3=`git -C $(m)/$(m)-infinity $(log)` ;\
	VERSION=`printf "$${d1}\n$${d2}\n$${d2}" | sort -r | head -n1` ;\
	$(changelog-entry)

