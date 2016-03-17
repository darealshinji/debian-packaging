include ../../mk/include.mk

deps          = git
builddir      = numptyphysics
srcfiles      = ../../mk/make-icons.sh
changelog-msg = Current development snapshot


download: $(builddir)

$(builddir):
	git clone "https://github.com/thp/numptyphysics" $(builddir)
	@ VERSION="`git -C $(builddir) describe --tags`"; $(changelog-entry)
	rm -rf $(builddir)/.git

