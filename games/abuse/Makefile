include ../../mk/include.mk

deps           = wget
bin            = abuse-0.8.tgz
distcleanfiles = $(bin)
builddir       = abuse-0.8

#url = http://abuse.zoy.org/raw-attachment/wiki/download/abuse-0.8.tar.gz
url = https://github.com/darealshinji/abuse-game/releases/download/0.8/abuse-0.8.tar.gz

download:
	@ $(call download,$(bin),$(url))
	@ $(call verifysha256,$(bin),0104db5fd2695c9518583783f7aaa7e5c0355e27c5a803840a05aef97f9d3488)
	rm -rf $(builddir)
	tar xfz $(bin)

