include ../../mk/include.mk

deps       = wget
bin        = opensurge.tar.gz
srcfiles   = opensurge-master/*
cleanfiles = opensurge-master

download:
	@ $(call download,$(bin),https://github.com/darealshinji/opensurge/archive/master.tar.gz)
	tar xvf $(bin)

