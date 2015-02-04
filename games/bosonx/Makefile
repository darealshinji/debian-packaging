include ../../mk/include.mk

deps       = wget
bin        = BosonX_v1_0_5_Linux.zip
cleanfiles = $(bin)
srcfiles   = $(bin)

download:
	test -f $(bin) || wget "http://downloads.muandheyo.com/$(bin)"
	@$(call verifysha256,$(bin),1e9e199a208fd98b00c16d7e89bdf002425e3c7f45887b6c76d9902de824270f)

