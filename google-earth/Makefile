include ../Makefile.inc

deps = wget dh-autoreconf
cleanfiles = $(bin) patchelfmod* debian/changelog
bin = GoogleEarthLinux.bin
srcfiles = patchelfmod.tar.gz files temp
srcpkg = google-earth
changelog-file = debian/changelog
changelog-msg = New release version

download:
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	wget "http://dl.google.com/earth/client/current/$(bin)"
	chmod a+x $(bin)
	./$(bin) --target temp --noexec
	VERSION=$$(head -n2 temp/setup.data/setup.xml | tail -n-1 | cut -d '"' -f2 | cut -d- -f1) ;\
	$(changelog-entry)

