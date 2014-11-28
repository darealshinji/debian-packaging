#!/bin/bash

# @(#) user4	Compare version numbers of form a.b.c.
# Adapted from post # 10.
# http://www.unix.com/unix-dummies-questions-answers/
# 93739-comparing-version-numbers.html#post302269675

pe() { for _i;do printf "%s" "$_i";done; printf "\n"; }
pl() { pe;pe "-----" ;pe "$*"; }
db() { ( printf " db, ";for _i;do printf "%s" "$_i";done;printf "\n" ) >&2 ; }
db() { : ; }

# compare version numbers
# usage: vercmp <versionnr1> <versionnr2>
#         with format for versions xxx.xxx.xxx
# returns: 0 if versionnr1 equal or greater
#          1 if versionnr1 lower

vercmp()
{
   local a1 b1 c1 a2 b2 c2
   # echo|read succeeds in ksh, but fails in bash.
   # bash alternative is "set --"
   db "input 1 \"$1\", 2 \"$2\" " 
   v1=$1
   v2=$2
   db "v1 $v1, v2 $v2"
   set -- $( echo "$v1" | sed 's/\./ /g' )
   a1=$1 b1=$2 c1=$3
   set -- $( echo "$v2" | sed 's/\./ /g' )
   a2=$1 b2=$2 c2=$3
   db "a1,b1,c1 $a1,$b1,$c1 ; a2,b2,c2 $a2,$b2,$c2"
   ret=$(( (a1-a2)*1000000+(b1-b2)*1000+c1-c2 ))
   db "ret is $ret"
   if [ $ret -lt 0 ] ; then
     v=-1
   elif [ $ret -eq 0 ] ; then
     v=0
   else
     v=1
   fi
   printf "%d" $v
   return
}


Sources="http://download.videolan.org/pub/debian/unstable/Sources"
STABLE_VERSION=$(wget -q -O - $Sources | grep -e '^Version: ' | sed -e 's/Version: //;' | cut -d- -f1)
GIT_VERSION=$(grep -e 'AC_INIT' libdvdcss/configure.ac | cut -d, -f2 | sed -e 's/ //g')
latestcommit=$(git -C libdvdcss/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')

VERSION=$STABLE_VERSION
git="+git${latestcommit}"

v=$( vercmp $STABLE_VERSION $GIT_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$GIT_VERSION
   git="~git${latestcommit}"
fi


# create Debian changelog
echo "libdvdcss (${VERSION}${git}) unstable; urgency=low" > libdvdcss/debian/changelog
#echo "libdvdcss ($VERSION) unstable; urgency=low" > libdvdcss/debian/changelog
echo "" >> libdvdcss/debian/changelog
echo "  * Current git snapshot" >> libdvdcss/debian/changelog
echo "" >> libdvdcss/debian/changelog
#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> libdvdcss/debian/changelog
echo "" >> libdvdcss/debian/changelog

