include ../../mk/include.mk

deps           = wget
bin            = sublime_text_3.tbz
srcfiles       = $(bin)
distcleanfiles = $(bin)
changelog-msg  = Current beta release

BITS = 32
ifeq ($(ARCH), amd64)
BITS = 64
endif

URL = $(shell wget -q -O - http://www.sublimetext.com/3 | grep 'x$(BITS).tar' | cut -d '"' -f6)
REV = $(shell echo $(URL) | cut -d '/' -f4 | cut -d '_' -f5)


download:
	@ $(call download,$(bin),$(URL))
	@ VERSION=$(REV); $(changelog-entry)

