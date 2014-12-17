include ../Makefile.inc

deps = wget unzip
bin = GrapplingHook_Demo.tar.gz
lwjgl = lwjgl-source-2.2.2.zip
srcfiles = $(bin) lwjgl-source/src/native ghook-demo.png
cleanfiles = $(bin) $(lwjgl) lwjgl-source ghook-demo.png

download:
	wget "http://ghook.speedrungames.com/download/$(bin)"
	wget -O $(lwjgl) 'http://downloads.sourceforge.net/project/java-game-lib/Official%20Releases/LWJGL%202.2.2/$(lwjgl)?r=&ts=1418789686'
	wget -O ghook-demo.png "http://fs1.directupload.net/images/141216/kvgj7f7q.png"
	@$(call verifysha256, $(bin), b1970af780ce6023f12b0689ec35bae4e4a806868ac9b48ad94e73a3452665bb)
	@$(call verifysha256, $(lwjgl), 634bff16316456328986fb51fe0eb8f4126a50070da5f2685d5324d750236e4d)
	unzip $(lwjgl) -d lwjgl-source
	cp liblwjgl.mk lwjgl-source/src/native/Makefile
