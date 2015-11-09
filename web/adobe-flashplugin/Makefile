include ../../mk/include.mk

deps       = wget
bin        = flashplayer.tgz
tmp        = _wget_tmp
srcfiles   = $(bin) ../../mk/patchelfmod
cleanfiles = $(tmp) $(bin)

BITS = 32
ifeq ($(ARCH),amd64)
BITS = 64
endif


download:
	rm -rf $(cleanfiles)
	wget -q -O $(tmp) 'https://get.adobe.com/flashplayer/download/?installer=Flash_Player_11.2_for_other_Linux_%28.tar.gz%29_$(BITS)-bit&standalone=1'
	url=$$(grep 'install_flash_player_11_linux' $(tmp) | cut -d "'" -f2); \
	wget -O $(bin) "$${url}"
	mkdir -p tmp && cd tmp && tar xvf ../$(bin)
	@ VERSION=`grep 'Version ' tmp/readme.txt | cut -d' ' -f2`; $(changelog-entry)

