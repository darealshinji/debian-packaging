include ../../mk/include.mk

deps     = git dh-autoreconf
builddir = nasm

download:
	rm -rf $(builddir) && git clone --depth 1 "git://repo.or.cz/nasm.git"
	@ VERSION=`cat $(builddir)/version`+git`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'` ; \
	$(changelog-entry)

