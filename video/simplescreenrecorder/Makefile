include ../../mk/include.mk

deps       = git
MAINTAINER = Maarten Baert (v2) <maarten-baert@hotmail.com>

download:
	rm -rf $(builddir)
	git clone "https://github.com/MaartenBaert/ssr.git" $(builddir)
	@ VERSION="`git -C $(builddir) describe`"; $(changelog-entry)

