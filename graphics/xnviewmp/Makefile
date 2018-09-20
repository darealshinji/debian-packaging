include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin)
cleanfiles     = $(deb)
bin            = XnViewMP.tgz
distcleanfiles = *.tgz xnviewmp_update.txt
changelog-msg  = New release version

#VERSION = $(shell wget -c -q http://www.xnview.com/xnviewmp_update.txt && head -n1 xnviewmp_update.txt | cut -d'=' -f2)
VERSION = 0.92
ver = 092


download:
	@ $(call download,XnViewMP.tgz,https://download.xnview.com/old_versions/XnViewMP-$(ver)-linux-x64.tgz)
	@ VERSION=$(VERSION); $(changelog-entry)

