include ../../include.mk

deps = wget unzip
bin = TheGame_2014-01-30
ega = YHtWtG_EGA
cleanfiles = $(bin)* $(ega)* icons*
srcfiles = files $(bin) $(ega)

download:
	wget "http://www.piratehearts.com/builds/$(bin).tar.gz"
	wget "http://www.piratehearts.com/files/$(ega).zip"
	@$(call verifysha256, $(bin).tar.gz, 83ed5a02d222d280e439355f381e1115736c9d14c83171ac25e6b211c59e6751)
	@$(call verifysha256, $(ega).zip, 476a90500101d995ff5cb41b5d8e6548721daf44eb4ae65ecf58c3ba6ca165d9)
	tar xzvf $(bin).tar.gz
	unzip $(ega).zip -d YHtWtG_EGA
