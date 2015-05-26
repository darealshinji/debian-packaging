include ../../mk/include.mk

deps       = wget
builddir   = pwnfps
cleanfiles = *.png
builddir   = pwnfps-master

download:
	$(call download,master.tar.gz,https://github.com/fanzyflani/pwnfps/archive/master.tar.gz)
	$(call download,pwnfps.png,http://fs1.directupload.net/images/150526/4yk2g2g5.png)
	tar xvf master.tar.gz
	mv pwnfps.png pwnfps-master
