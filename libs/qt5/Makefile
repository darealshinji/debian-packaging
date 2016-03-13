include ../../mk/include.mk

ARCH = amd64

deps           = wget
srcfiles       = *.7z *.rpm patchelf.cpp
cleanfiles     = debian/control *.xml
distcleanfiles = *.7z *.rpm *.sha1 patchelf.cpp

QTVER1 = 5.6
QTVER2 = 5.6.0


download:
	./download.sh
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call download,mysql.rpm,ftp://195.220.108.108/linux/centos/6.7/os/x86_64/Packages/mysql-libs-5.1.73-5.el6_6.x86_64.rpm)
	@ $(call download,openssl.rpm,ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/openssl-1.0.1e-42.el6_7.4.x86_64.rpm)
	@ $(call verifysha256,mysql.rpm,8d301fd399dd0cfe5e2dd8bce6d2436d04aa2b78278d0ae7b0c5ea4c4447a659)
	@ $(call verifysha256,openssl.rpm,e5fc87d5031ea23db0eb2be92743a557d8574caa583fad6a1cd16a757ed436f3)
	sed -e 's/@VERSION@/$(QTVER1)/g' debian/control.in > debian/control
	@ VERSION=$(QTVER2); $(changelog-entry)

