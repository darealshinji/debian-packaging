include ../../mk/include.mk

ARCH       = i386
deps       = wget
cleanfiles = $(bin)*
srcfiles   = $(bin)
VERSION    = 1_5_8
bin        = DivX265

download:
	@ $(call download,$(bin),http://download.divx.com/hevc/$(bin)_$(VERSION))
	@ $(call verifysha256,$(bin),d8bfbfac33280358fee85580c8694ccecb9a97cb6a78dba9e9c6e8942230fcb3)

