include ../../mk/include.mk

deps           = wget
bin            = giteye.zip
srcfiles       = $(bin) ../../mk/make-icons.sh
distcleanfiles = $(bin)
changelog-msg  = New release version

BINARCH = Linux32
ifeq ($(ARCH), amd64)
BINARCH = Linux64
endif

LINK    = $(shell wget -q -O - http://www.collab.net/downloads/giteye | grep '$(BINARCH)' | tr '"' '\n' | grep 'servlets')
URL     = $(shell wget -q -O - http://www.collab.net/$(LINK) | grep 'zip' | head -n1 | cut -d '"' -f4 | cut -d '=' -f2)
VERSION = $(shell echo $(LINK) | cut -d '=' -f2 | sed 's/GitEye//; s/$(BINARCH)//;')


download:
	@ $(call download,$(bin),$(URL))
	@ VERSION=$(VERSION); $(changelog-entry)

