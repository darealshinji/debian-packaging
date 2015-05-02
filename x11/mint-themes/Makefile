include ../../mk/include.mk

deps       = git
MAINTAINER = Clement Lefebvre <root@linuxmint.com>

download:
	rm -rf mint-* share
	git clone --depth 1 "https://github.com/linuxmint/mint-themes.git"
	git clone --depth 1 "https://github.com/linuxmint/mint-themes-gtk3.git"
	git clone --depth 1 "https://github.com/linuxmint/mint-x-icons.git"

	@ VER1=$$(git -C mint-themes/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VER2=$$(git -C mint-x-icons/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VER3=$$(git -C mint-themes-gtk3/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VERSION=`echo $$VER1 $$VER2 $$VER3 | tr ' ' '\n' | sort -r | head -1`; \
	$(changelog-entry)

	rm -rf mint-themes/usr/share/libreoffice
	mv mint-x-icons/usr/share .
	cp -rf mint-themes/usr/share/* mint-themes-gtk3/usr/share/* share/
	cp -rf alternative-deb-icons/Mint-X share/icons
	rm -rf mint-*

	find share -name .gitkeep -delete
	find share -name start-here.* -delete
	find share -name gnome-main-menu.* -delete  # symlink to start-here.svg
	find share -name novell-button.* -delete  # symlink to start-here.svg
	find share -type f -exec chmod 0644 '{}' \;

	mkdir -p $(builddir) && mv share $(builddir)

