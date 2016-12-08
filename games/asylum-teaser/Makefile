include ../../mk/include.mk

deps           = git wget unzip
cleanfiles     = *.png
dir            = Asylum-Teaser
bin            = Asylum_Teaser_Unix.zip
cleanfiles     = $(dir) *.png
distcleanfiles = $(bin)
srcfiles       = $(dir) files *.png ../../mk/make-icons.sh

# http://www.facethehorror.com/files/Asylum_Teaser_Unix.zip
# http://www.indiedb.com/games/asylum-face-the-horror/downloads/asylum-interactive-teaser-ubuntu

ID = 45643
include ../../mk/get_indiedb_download_url.mk

download:
	@ $(call download,$(bin),$(indiedb_download_url))

	test -d $(dir) || ( git clone --depth 1 "https://github.com/Senscape/Asylum-Teaser.git" && \
	wget -O asylum-teaser.png "http://s14.directupload.net/images/141112/cbqmarg3.png" )

	ln -sf ../$(bin) $(dir)/$(bin)
	cd Asylum-Teaser && ./download-game-content.sh
