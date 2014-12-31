include ../../include.mk

cleanfiles = game-data* debian/copyright
srcfiles = files game-data.txz
GAMEDIR = "$(shell echo $$HOME)/.steam/steam/SteamApps/common/You Have to Win the Game/"

download:
	@if [ ! -d $(GAMEDIR) ] ; then \
    echo "can't find "\"$(GAMEDIR)\" ;\
    echo "" ;\
    echo "First you have to install 'You Have to Win the Game' via Steam:" ;\
    echo "http://store.steampowered.com/app/286100/" ;\
    echo "" ;\
    exit 1 ;\
fi
	iconv -f ISO-8859-1 -t UTF-8 $(GAMEDIR)/License.txt > debian/copyright
	mkdir -p game-data
	cp $(GAMEDIR)/* game-data
	chmod 0644 game-data/*
	chmod 0755 game-data/TheGame_NFML
	tar -cJf game-data.txz game-data
