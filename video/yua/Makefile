include ../../mk/include.mk

deps           = wget
bin1           = Yua.tgz
bin2           = yua-git.tgz
srcfiles       = Yua yua-master/share
cleanfiles     = Yua yua-master
distcleanfiles = $(bin1) $(bin2)

download:
	test -f $(bin1) || wget -O $(bin1) "http://nate.quandra.org/yua/linux/Yua.tar.gz"
	test -f $(bin2) || wget -O $(bin2) "https://github.com/darealshinji/yua/archive/master.tar.gz"
	tar xvf $(bin1)
	tar xvf $(bin2)
	chmod a+x Yua
	@ VERSION=`./Yua --version` ; $(changelog-entry)

