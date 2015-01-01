include ../../include.mk

deps = wget
bin = SublimeText2.tar.bz2
srcfiles = $(bin)

ifeq ($(shell uname -p), x86_64)
sha256sum = 01baed30d66432e30002a309ff0393967be1daba5cce653e43bba6bd6c38ab84
x64 = %20x64
else
sha256sum = 07338e041cfb348938fa8069f0aad3b5b43c319b7ec564ffff1489796f2dcf08
endif

download:
	wget -O $(bin) "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2$(x64).tar.bz2"
	@$(call verifysha256,$(bin),$(sha256sum))

