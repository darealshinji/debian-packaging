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


SRC_VERSION=$(grep -e 'POINTVERSION' notepadqq/src/ui/include/notepadqq.h | \
              cut -d' ' -f3 | sed -e 's/\"//g')
TAG_VERSION=$(git -C notepadqq/ describe --abbrev=0 --tags | sed -e 's/v//g')
latestcommit=$(git -C notepadqq/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')

VERSION=$TAG_VERSION
git="+git${latestcommit}"

v=$( vercmp $TAG_VERSION $SRC_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$SRC_VERSION
   git="~git${latestcommit}"
fi


# create new Debian changelog entry
mv notepadqq/debian/changelog notepadqq/debian/changelog.in

echo "notepadqq (${VERSION}${git}-1~trusty) trusty; urgency=low" > changelog.new
#echo "notepadqq ($VERSION-1) unstable; urgency=low" > changelog.new
echo "" >> changelog.new
echo "  * Current git snapshot" >> changelog.new
echo "" >> changelog.new
#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
echo "" >> changelog.new
cat changelog.new notepadqq/debian/changelog.in > notepadqq/debian/changelog
rm changelog.new

