include ../../include.mk

# Sublime Text 3 is currently in beta
REVISION = 3065

deps = wget
bin = sublime_text_3.tar.bz2
srcfiles = $(bin)

ifeq ($(ARCH), amd64)
sha256sum = fe548e6d86d72cd7e90eee9d5396b590ae6e8f8b0dfc661d86c814214e60faea
BITS = 64
endif
ifeq ($(ARCH), i386)
sha256sum = e25f84fe0d0c02ce71274d334fd42ce6313adcd4ec1d588b165d25f5e93ad78d
BITS = 32
endif

download:
	wget -O $(bin) "http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_$(REVISION)_x$(BITS).tar.bz2"
	@$(call verifysha256,$(bin),$(sha256sum))

