#!/bin/sh -e

ver="56"
rev="5.6.0-0"
repo="http://download.qt.io/online/qtsdkrepository/linux_x64/desktop/qt5_${ver}"

wget $repo/Updates.xml
archives="$(grep '<DownloadableArchives>' Updates.xml | grep 'qtbase' | cut -d '>' -f2 | cut -d '<' -f1 | tr -d ,)"
rm Updates.xml

for f in $archives ; do
    test -f ${rev}${f} || wget $repo/qt.${ver}.gcc_64/${rev}${f}
    test -f ${rev}${f}.sha1 || wget $repo/qt.${ver}.gcc_64/${rev}${f}.sha1
    test -f ${rev}${f}.sha1 || (echo "`cat ${rev}${f}.sha1`  ${rev}${f}" | sha1sum -c -)
done
