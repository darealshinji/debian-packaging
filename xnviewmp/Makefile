include ../Makefile.inc

deps = wget
srcfiles = $(bin)
cleanfiles = XnView
distcleanfiles = $(bin) $(srcfiles)
srcpkg = xnviewmp

bin = XnViewMP-linux$(x64).tgz
ifeq ($(shell uname -p), x86_64)
x64 = -x64
endif

download:
	test -f $(bin) || wget "http://download.xnview.com/$(bin)"
	tar xvf $(bin)
	VERSION=$$(head -n1 XnView/WhatsNew.txt | sed -e 's/Changelog //; s/://;' | tr -d '[:cntrl:]') ;\
	$(changelog-entry)
