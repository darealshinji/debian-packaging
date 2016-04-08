include ../../mk/include.mk

deps     = git
builddir = alephone

download:
	test -d $(builddir) || git clone --depth 1 https://github.com/Aleph-One-Marathon/alephone
	@ version=`grep '^#define A1_DISPLAY_VERSION' $(builddir)/Source_Files/Misc/alephversion.h | cut -d '"' -f2` ;\
	latestcommit=`git -C $(builddir) log -1 --format=%ci | head -c10 | sed -e 's/-//g'` ;\
	VERSION=$$version+git$$latestcommit ; $(changelog-entry)

