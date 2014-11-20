include ../Makefile.inc

deps = 
cleanfiles = build.log tmp debian/copyright

GAMEDIR = "$(shell echo $$HOME)/.steam/steam/SteamApps/common/You Have to Win the Game/"


all: deps download build

nodeps: download build

build: checkarch clean
	@if [ ! -d $(GAMEDIR) ] ; then \
    echo "can't find "\"$(GAMEDIR)\" ;\
    echo "" ;\
    echo "First you have to install 'You Have to Win the Game' via Steam:" ;\
    echo "http://store.steampowered.com/app/286100/" ;\
    echo "" ;\
    exit 1 ;\
fi
	mkdir -p tmp
	cp $(GAMEDIR)/* tmp/
	@$(buildpackage)

checkarch:
ifneq ($(shell uname -p), x86_64)
	@echo "" ;\
	echo "'You Have to Win the Game' is only available for x86_64 architectures." ;\
	exit 1
endif

download:

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

