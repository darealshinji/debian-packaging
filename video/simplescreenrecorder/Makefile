include ../../mk/include.mk

deps       = git
MAINTAINER = Maarten Baert (v2) <maarten-baert@hotmail.com>

download:
	[ -d $(builddir) ] || git clone "https://github.com/MaartenBaert/ssr.git" $(builddir);
	@ [ -f $(builddir)/debian/changelog ] || ( VERSION="`git -C $(builddir) describe`"; $(changelog-entry) )

