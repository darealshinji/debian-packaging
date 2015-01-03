include ../../include.mk

ARCH = i386

deps = wget unzip
bin = NeroAACCodec-1.5.1.zip
srcfiles = neroaac
cleanfiles = $(srcfiles) $(bin)

download:
	wget "ftp://ftp6.nero.com/tools/$(bin)"
	@$(call verifysha256,$(bin),e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b)
	unzip $(bin) -d neroaac

