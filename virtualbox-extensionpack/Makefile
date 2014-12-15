include ../Makefile.inc

deps = wget
bin = Oracle_VM_VirtualBox_Extension_Pack-4.3.20-96996.vbox-extpack
sha256sum = 7e1253f7013e9cdc84a614a0db38b40de7bbd330cb5b85bd3ef3de213773450d
cleanfiles = $(bin) debian/postinst
srcfiles = $(bin)

download:
	wget "http://download.virtualbox.org/virtualbox/4.3.20/$(bin)"
	@$(call verifysha256, $(bin), $(sha256sum))
	sed -e 's/@bin@/$(bin)/; s/@sha256sum@/$(sha256sum)/;' \
	debian/postinst.in > debian/postinst
