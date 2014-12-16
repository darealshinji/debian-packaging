
include ../Makefile.inc

deps = wget
bin = GrapplingHook_Demo.tar.gz
srcfiles = $(bin) ghook-demo.png
cleanfiles = $(srcfiles)

download:
	wget "http://ghook.speedrungames.com/download/$(bin)"
	wget -O ghook-demo.png "http://fs1.directupload.net/images/141216/kvgj7f7q.png"
	@$(call verifysha256, $(bin), b1970af780ce6023f12b0689ec35bae4e4a806868ac9b48ad94e73a3452665bb)

