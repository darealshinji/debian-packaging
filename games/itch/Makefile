include ../../mk/include.mk

deps           = git wget
srcfiles       = ../../mk/make-icons.sh itchapp/*
distcleanfiles = itchapp

ifeq ($(ARCH),amd64)
node_arch=x64
else
node_arch=x86
endif

grunt_dev    = $(shell wget -q -O- "https://raw.githubusercontent.com/gruntjs/grunt/master/package.json" | grep '\"version\":' | cut -d '"' -f4)
node_release = wget -q -O- "https://nodejs.org/dist/latest/SHASUMS256.txt" | grep -e 'node-.*-linux-$(node_arch).tar.xz'
node_bin     = $(shell $(node_release) | awk '{print $$2}')
node_sha256  = $(shell $(node_release) | awk '{print $$1}')
npm          = PATH="$$PWD/`cat NODE-RELEASE`/bin:$$PATH" npm


download: itchapp
	@ VERSION=`grep '\"version":' itchapp/package.json | cut -d '"' -f4 | sed 's|-canary||'`; \
	$(changelog-entry)

itchapp:
	git clone --depth 1 "https://github.com/itchio/itch.git" itchapp
	git clone --depth 1 "https://github.com/sass/sassc.git" itchapp/sassc
	git clone --depth 1 "https://github.com/sass/libsass.git" itchapp/sassc/libsass
	cd itchapp && rm -rf .git sassc/.git sassc/libsass/.git

	@ $(call download,itchapp/node.tar.xz,https://nodejs.org/dist/latest/$(node_bin))
	@ $(call verifysha256,itchapp/node.tar.xz,$(node_sha256))
	echo $(node_bin) | sed 's|\.tar\.xz||' > itchapp/NODE-RELEASE
	cd itchapp && tar xf node.tar.xz

	@ # http://stackoverflow.com/a/15483897/5687704
	cd itchapp && $(npm) cache clean && \
	$(npm) set tmp /tmp && \
	$(npm) install && \
	$(npm) install grunt@$(grunt_dev)

	cd itchapp && tar cfz node_modules.tar.gz node_modules && \
	rm -rf `cat NODE-RELEASE` node_modules
