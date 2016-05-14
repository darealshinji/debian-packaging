include ../../mk/include.mk

deps           = wget
bin            = poweriso.tgz
srcfiles       = $(bin)
cleanfiles     = $(bin) debian/changelog
changelog-msg  = Initial release
version        = 1.3


download:
	@ $(call download,$(bin),http://www.poweriso.com/poweriso-$(version).tar.gz)
	@ $(call verifysha256,$(bin),605ae3fceb93952422b42d868f1317d1c6d48d2bdbaee700dcf17e99dbe65fc0)
	@ VERSION=$(version); $(changelog-entry)

