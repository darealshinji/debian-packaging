include ../../mk/include.mk

deps       = git
srcfiles   = mint-themes mint-themes-gtk3 mint-x-icons
cleanfiles = $(srcfiles)
MAINTAINER = Clement Lefebvre <root@linuxmint.com>

download:
	git clone --depth 1 "https://github.com/linuxmint/mint-themes-gtk3.git"
	git clone --depth 1 "https://github.com/linuxmint/mint-x-icons.git"
	git clone --depth 1 "https://github.com/linuxmint/mint-themes.git"
	@ VER1=$$(git -C mint-themes/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VER2=$$(git -C mint-x-icons/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VER3=$$(git -C mint-themes-gtk3/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VERSION=`echo $$VER1 $$VER2 $$VER3 | tr ' ' '\n' | sort -r | head -1`; \
	$(changelog-entry)
	rm -rf mint-themes/.git mint-x-icons/.git mint-themes-gtk3/.git

