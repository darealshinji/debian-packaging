include ../../mk/include.mk

deps       = wget
srcfiles   = $(BIN) dagon.png ../../mk/make-icons.sh
cleanfiles = dagon.png

BIN  = Dagon-0.6.8a-portable-linux.tar.xz
URL1 = https://drive.google.com/uc?export=download&id=0BxClEVSW8QykRVdqTDhuWURoaFU
URL2 = https://github.com/Senscape/Dagon/raw/4095f51404d91702f96dcdf3361989aa03d6fb80/xcode/Resources/Images.xcassets/AppIcon.appiconset/Dagon512x512.png

download:
	$(call download,$(BIN),$(URL1))
	$(call download,dagon.png,$(URL2))
	$(call verifysha256,$(BIN),6667d99fb1eb5546883adcfaba621aefc4cf2ac4b72ee4d3c26010fd8d442180)
	$(call verifysha256,dagon.png,67727650699cee422a464dd8ff40f58ed37b5c6033bc8bdd86425963ba225a94)
	VERSION="0.6.8a"; $(changelog-entry)

