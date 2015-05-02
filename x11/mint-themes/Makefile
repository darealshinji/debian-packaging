include ../../mk/include.mk

deps       = git
MAINTAINER = Clement Lefebvre <root@linuxmint.com>

download:
	rm -rf mint-* usr
	git clone --depth 1 "https://github.com/linuxmint/mint-themes.git"
	git clone --depth 1 "https://github.com/linuxmint/mint-themes-gtk3.git"
	git clone --depth 1 "https://github.com/linuxmint/mint-x-icons.git"

	@ VER1=$$(git -C mint-themes/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VER2=$$(git -C mint-x-icons/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VER3=$$(git -C mint-themes-gtk3/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	VERSION=`echo $$VER1 $$VER2 $$VER3 | tr ' ' '\n' | sort -r | head -1`; \
	$(changelog-entry)

	rm -rf mint-themes/usr/lib mint-themes/usr/share/libreoffice
	mv mint-x-icons/usr . && cp -rf mint-themes/usr/* mint-themes-gtk3/usr/* usr/
	cp -rf alternative-deb-icons/Mint-X usr/share/icons
	rm -rf mint-*

	find usr -name .gitkeep -delete
	find usr -name start-here.* -delete
	find usr -name gnome-main-menu.* -delete  # symlink to start-here.svg
	find usr -name novell-button.* -delete  # symlink to start-here.svg
	find usr -type f -exec chmod 0644 '{}' \;

	mkdir -p $(builddir) && mv usr $(builddir)

