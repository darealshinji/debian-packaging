include ../../mk/include.mk

ARCH       = i386
deps       = wget
builddir   = $(DIR)
DIR        = divx611-20060201-gcc4.0.1
cleanfiles = $(DIR)*

download:
	wget "http://download.divx.com/labs/$(DIR).tar.gz"
	@$(call verifysha256,$(DIR).tar.gz,e54d55153b02c38776a5debd675e5242a862b7a9369fc1f5e357e23bece828af)
	tar xfv $(DIR).tar.gz

