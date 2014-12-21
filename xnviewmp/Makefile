include ../Makefile.inc

deps = wget
srcfiles = $(bin)
distcleanfiles = $(bin) $(srcfiles)
srcpkg = xnviewmp

bin = XnViewMP-linux$(x64).tgz
ifeq ($(shell uname -p), x86_64)
x64 = -x64
endif

download:
	test -f $(bin) || wget "http://download.xnview.com/$(bin)"
	tar xvf $(bin)
	./changelog.sh
	rm -rf XnView
