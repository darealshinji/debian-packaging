include ../../mk/include.mk

ARCH       = i386
deps       = wget
bin        = mrred.tar.gz
icon       = mrred.png
cleanfiles = $(icon)
srcfiles   = $(bin) $(icon)

download:
	@ $(call download,$(bin),https://www.dropbox.com/s/z8b534gi6xxhgki/Mr%20Reds%20Adventure%20TMB.tar.gz?dl=1)
	@ $(call download,$(icon),http://s14.directupload.net/images/140508/oslo47cn.png)
	@ $(call verifysha256,$(bin),ae0164bfc842a409016518985f8e1f11e07d4730209eb891a36d04135e283049)
	@ $(call verifysha256,$(icon),9ebf5ffa772744bdd2d9b6b0f83e85a44fe521aac6a83741a0a4fff7aee30056)

