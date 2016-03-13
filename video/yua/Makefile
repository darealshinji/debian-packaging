include ../../mk/include.mk

deps           = wget
bin1           = Yua.txz
bin2           = yua-git.tgz
srcfiles       = Yua yua-master/share
cleanfiles     = Yua yua-master
distcleanfiles = $(bin1) $(bin2)

VER = 9

# slow download
#http://nate.quandra.org/yua/linux/Yua.tar.gz


download:
	@ $(call download,$(bin1),https://github.com/darealshinji/yua/releases/download/v$(VER)/yua-v$(VER)-linux-amd64-static_qt5.tar.xz)
	@ $(call download,$(bin2),https://github.com/darealshinji/yua/archive/master.tar.gz)
	@ $(call verifysha256,$(bin1),4587e66d4b5456722e55195f51737436f41eed54a48d463e3093765459f6a5d0)
	tar xvf $(bin1)
	tar xvf $(bin2)
	chmod a+x Yua
	@ VERSION="$(VER)"; $(changelog-entry)

