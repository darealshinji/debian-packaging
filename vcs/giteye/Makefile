include ../../mk/include.mk

deps           = wget
bin            = giteye.zip
srcfiles       = $(bin)
distcleanfiles = $(srcfiles)
changelog-msg  = New release version

BINARCH = Linux32
ifeq ($(ARCH), amd64)
BINARCH = Linux64
endif

DOMAIN  = https://www.collab.net
LINK    = $(shell wget -q -O - $(DOMAIN)/downloads/giteye | grep '$(BINARCH)' | tr '"' '\n' | grep 'servlets')
URL     = $(shell wget -q -O - $(DOMAIN)$(LINK) | grep 'zip' | head -n1 | cut -d '"' -f4 | cut -d '=' -f2)
VERSION = $(shell echo $(LINK) | cut -d '=' -f2 | sed 's/GitEye//; s/$(BINARCH)//;')


download:
	@ $(call download,$(bin),$(URL))
	@ VERSION=$(VERSION); $(changelog-entry)

