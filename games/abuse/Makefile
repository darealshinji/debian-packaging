include ../../mk/include.mk

deps     = wget dh-autoreconf
builddir = abuse-master
bin      = master.tar.gz

download:
	test -f $(bin) || wget "https://github.com/darealshinji/abuse/archive/$(bin)"
	tar xvf $(bin)

