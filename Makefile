# The MIT License (MIT)
#
# Copyright (C) 2016, djcj <djcj@gmx.de>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


export LANG=C
export LANGUAGE=C
export LC_ALL=C

ARCH := $(shell dpkg-architecture -qDEB_HOST_ARCH)
MAKE ?= make

include mk/create_basetgz.mk

basetgz_i386 = "$(basetgz_path)/debian-packages-i386.tgz"
basetgz_amd64 = "$(basetgz_path)/debian-packages-amd64.tgz"



all: help

help:
	@ echo
	@ echo "make help"
	@ echo "   show this message"
	@ echo
	@ echo "make list"
	@ echo "   list all available packages"
	@ echo
	@ echo "make basetgz"
	@ echo "   build the pbuilder basetgz file for the current architecture"
	@ echo
	@ echo "make basetgz-i386"
	@ echo "   build the pbuilder basetgz file for i386"
	@ echo
	@ echo "make basetgz-amd64"
	@ echo "   build the pbuilder basetgz file for amd64"
	@ echo
	@ echo "make basetgz-all"
	@ echo "   build the pbuilder basetgz file for i386 and amd64"
	@ echo
	@ echo "make remove-basetgz"
	@ echo "   remove the pbuilder basetgz file for the current architecture"
	@ echo
	@ echo "make remove-basetgz-i386"
	@ echo "   remove the pbuilder basetgz file for i386"
	@ echo
	@ echo "make remove-basetgz-amd64"
	@ echo "   remove the pbuilder basetgz file for amd64"
	@ echo
	@ echo "make remove-basetgz-all"
	@ echo "   remove the pbuilder basetgz file for i386 and amd64"
	@ echo
	@ echo "make pbuilder-clean"
	@ echo "   remove pbuilder's temporary build and cache files"
	@ echo

list:
	@ find */* -maxdepth 0 -type d | grep -v -e '^mk/'

basetgz: $(basetgz)
basetgz-all: $(basetgz_i386) $(basetgz_amd64)

basetgz-i386: $(basetgz_i386)
$(basetgz_i386):
	@ basetgz=$@; $(create_basetgz)

basetgz-amd64: $(basetgz_amd64)
$(basetgz_amd64):
	@ basetgz=$@; $(create_basetgz)

remove-basetgz:
	sudo -k rm -vf $(basetgz)

remove-basetgz-i386:
	sudo -k rm -vf $(basetgz_i386)

remove-basetgz-amd64:
	sudo -k rm -vf $(basetgz_amd64)

remove-basetgz-all:
	sudo -k rm -vf $(basetgz_i386) $(basetgz_amd64)

pbuilder-clean:
	sudo -k pbuilder --clean

