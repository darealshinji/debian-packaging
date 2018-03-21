include ../../mk/include.mk

deps           = wget
zipfile        = electron-api-demos-linux.zip
srcfiles       = data $(zipfile) ../../mk/make-icons.sh
distcleanfiles = data/*/webgl/WebGL.* $(zipfile) download-stamp

download: download-stamp
	@ $(call download,$(zipfile),https://github.com/electron/electron-api-demos/releases/download/v1.3.0/$(zipfile))
	@ $(call verifysha256,$(zipfile),0e3fd246999f71cc732a0b581b15321974f134f6ba29e625ef1d9dbc6c65fc8e)

download-stamp:
	./download.sh && touch download-stamp

