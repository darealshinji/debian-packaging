include ../../mk/include.mk

deps       = wget
cleanfiles = *.vbox-extpack debian/control debian/postinst
srcfiles   = $(bin)

URL        = http://download.virtualbox.org/virtualbox
bin        = Oracle_VM_VirtualBox_Extension_Pack-$(version).vbox-extpack
sha256sum  = $(shell wget -q -O - $(URL)/$(version)/SHA256SUMS | grep -e '$(bin)' | cut -d' ' -f1)

changelog-msg = Release version $(version)
version       = $(shell wget -q -O - $(URL)/LATEST.TXT)
major_minor   = $(shell echo $(version) | cut -d. -f1,2)
next          = $(major_minor).$(shell echo $$(( $$(echo $(version) | cut -d. -f3) + 1 )) )

download:
	wget "$(URL)/$(version)/$(bin)"
	@ $(call verifysha256, $(bin), $(sha256sum))
	sed -e 's/@bin@/$(bin)/; s/@sha256sum@/$(sha256sum)/;' debian/postinst.in > debian/postinst
	sed -e 's/@VERSION@/$(version)/g; s/@MAJ_MIN@/$(major_minor)/g; s/@NEXT@/$(next)/g' debian/control.in > debian/control
	@ VERSION=$(version) ; $(changelog-entry)
