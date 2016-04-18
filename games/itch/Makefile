include ../../mk/include.mk

deps       = git wget
builddir   = itchapp
srcfiles   = ../../mk/make-icons.sh
cleanfiles = debian/changelog

ifeq ($(ARCH),amd64)
node_arch=x64
else
node_arch=x86
endif

grunt_dev    = $(shell wget -q -O- "https://raw.githubusercontent.com/gruntjs/grunt/master/package.json" | grep '\"version\":' | cut -d '"' -f4)
node_release = wget -q -O- "https://nodejs.org/dist/latest/SHASUMS256.txt" | grep -e 'node-.*-linux-x64.tar.xz'
node_bin     = $(shell $(node_release) | awk '{print $$2}')
node_sha256  = $(shell $(node_release) | awk '{print $$1}')
npm          = PATH="$$PWD/`cat NODE-RELEASE`/bin:$$PATH" npm


download: $(builddir)

$(builddir):
	git clone --depth 1 "https://github.com/itchio/itch.git" $(builddir)
	git clone --depth 1 "https://github.com/sass/sassc.git" $(builddir)/sassc
	git clone --depth 1 "https://github.com/sass/libsass.git" $(builddir)/sassc/libsass
	cd $(builddir) && rm -rf .git sassc/.git sassc/libsass/.git

	@ $(call download,$(builddir)/node.tar.xz,https://nodejs.org/dist/latest/$(node_bin))
	@ $(call verifysha256,$(builddir)/node.tar.xz,$(node_sha256))
	echo $(node_bin) | sed 's|\.tar\.xz||' > $(builddir)/NODE-RELEASE
	cd $(builddir) && tar xf node.tar.xz

	@ # http://stackoverflow.com/a/15483897/5687704
	cd $(builddir) && $(npm) cache clean && \
	$(npm) set tmp /tmp && \
	$(npm) install && \
	$(npm) install grunt@$(grunt_dev)

	cd $(builddir) && tar cfz node_modules.tar.gz node_modules && \
	rm -rf `cat NODE-RELEASE` node_modules

	@ VERSION=`grep '\"version":' $(builddir)/package.json | cut -d '"' -f4 | sed 's|-canary||'`; \
	$(changelog-entry)

