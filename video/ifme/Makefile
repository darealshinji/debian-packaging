include ../../mk/include.mk

deps       = wget
png        = ifme.png
srcfiles   = $(png) ../../mk/make-icons.sh
cleanfiles = $(png)

download:
	@ $(call download,$(png),http://fs5.directupload.net/images/160429/6mapnw3m.png)
	@ $(call verifysha256,$(png),38454f29c217bc4a0209cec08a0ace3b8b4e96232a06aba3f572a93ff0c7ec9a)

