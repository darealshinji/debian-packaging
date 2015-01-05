#!/bin/bash

set -e

# This file is a concatenation of the following three scripts from
# the pbuilder package:
#   /usr/lib/pbuilder/pbuilder-satisfydepends-funcs
#   /usr/lib/pbuilder/pbuilder-satisfydepends-aptitude
#   /usr/lib/pbuilder/pbuilder-satisfydepends-checkparams

#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA



#   pbuilder -- personal Debian package builder
#   Copyright (C) 2001,2002,2003,2005-2007 Junichi Uekawa
#   Copyright (C) 2007 Loïc Minier
#
# module to satisfy build dependencies; common functions


package_versions() {
	local PACKAGE="$1"
	LC_ALL=C $CHROOTEXEC /usr/bin/apt-cache show "$PACKAGE" | sed -n 's/^Version: //p'
}

candidate_version() {
	local PACKAGE="$1"
	LC_ALL=C $CHROOTEXEC apt-cache policy "$PACKAGE" | sed -n 's/ *Candidate: //p'
}

checkbuilddep_versiondeps() {
    local PACKAGE="$1"
    local COMPARESTRING="$2"
    local DEPSVERSION="$3"
    local PACKAGEVERSIONS=$( package_versions "$PACKAGE" | xargs)
    # no versioned provides.
    if [ "${FORCEVERSION}" = "yes" ]; then
	return 0;
    fi
    for PACKAGEVERSION in $PACKAGEVERSIONS ; do
      if dpkg --compare-versions "$PACKAGEVERSION" "$COMPARESTRING" "$DEPSVERSION"; then
	# satisfies depends
	return 0;
      fi
    done
    echo "      Tried versions: $PACKAGEVERSIONS"
    # cannot satisfy depends
    return 1;
}

get_source_control_field() {
    local field="$1"

    sed -n -e "s/^$field://i" -e '
t store
/^-----BEGIN PGP SIGNED MESSAGE-----$/ {
    : pgploop
    n
    /^$/ d
    b pgploop
}
/^$/q
d
: store
H
: loop
n
/^#/ b loop
/^[ \t]/ b store
x
# output on single line
s/\n//g
# change series of tabs and spaces into a space
s/[\t ]\+/ /g
# normalize space before and after commas
s/ *, */, /g
# normalize space before and after pipes
s/ *| */ | /g
# normalize space before and after parentheses
s/ *( */ (/g
s/ *) */)/g
# normalize space before and after brackets
s/ *\[ */ [/g
s/ *\] */]/g
# normalize space after exclamation mark
s/! */!/g
# normalize space between operator and version
s/(\(>>\|>=\|>\|==\|=\|<=\|<<\|<\|!=\) *\([^)]*\))/(\1 \2)/g
# normalize space at beginning and end of line
s/^ *//
s/ *$//
p' \
        "$DEBIAN_CONTROL"
}

get_build_deps() {
    local output

    output="`get_source_control_field "Build-Depends"`"
    output="${output%, }"
    if [ "$BINARY_ARCH" = no ]; then
        output="${output:+$output, }`get_source_control_field "Build-Depends-Indep"`"
        output="${output%, }"
    fi
    echo "$output"
}

get_build_conflicts() {
    local output

    output="`get_source_control_field "Build-Conflicts"`"
    if [ "$BINARY_ARCH" = no ]; then
        output="${output:+$output, }`get_source_control_field "Build-Conflicts-Indep"`"
    fi
    echo "$output"
}

checkbuilddep_archdeps() {
    # returns FALSE on INSTALL
    local INSTALLPKG="$1"
    local ARCH="$2"
    # architectures listed between [ and ] for this dep
    local DEP_ARCHES="$(echo "$INSTALLPKG" | sed -e 's/.*\[\(.*\)\].*/\1/' -e 'y|/| |')"
    local PKG="$(echo "$INSTALLPKG" | cut -d ' ' -f 1)"
    local USE_IT
    local IGNORE_IT
    local INCLUDE
    # Use 'dpkg-architecture' to support architecture wildcards.
    for d in $DEP_ARCHES; do
        if echo "$d" | grep -q '!'; then
            d="$(echo $d | sed 's/!//')"
            if dpkg-architecture -a$ARCH -i$d; then
                IGNORE_IT="yes"
            fi
        else
            if dpkg-architecture -a$ARCH -i$d; then
                USE_IT="yes"
            fi
            INCLUDE="yes"
        fi
    done
    if [ $IGNORE_IT ] && [ $USE_IT ]; then
        printf "W: inconsistent arch restriction on $PKG: " >&2
        printf "$DEP_ARCHES depedency\n" >&2
    fi
    if [ $IGNORE_IT ] || ( [ $INCLUDE ] && [ ! $USE_IT ] ); then
        return 0
    fi
    return 1
}

checkbuilddep_provides() {
    local PACKAGENAME="$1"
    # PROVIDED needs to be used outside of this function.
    PROVIDED=$($CHROOTEXEC /usr/bin/apt-cache showpkg $PACKAGENAME \
	| awk '{p=0}/^Reverse Provides:/,/^$/{p=1}{if(p && ($0 !~ "Reverse Provides:")){PACKAGE=$1}} END{print PACKAGE}')
}

# returns either "package=version", to append to an apt-get install line, or
# package
versioneddep_to_aptcmd() {
	local INSTALLPKG="$1"

	local PACKAGE
	local PACKAGE_WITHVERSION
	local PACKAGEVERSIONS
	local CANDIDATE_VERSION
	local COMPARESTRING
	local DEPSVERSION

	PACKAGE="$(echo "$INSTALLPKG" | sed -e 's/^[/]*//' -e 's/[[/(].*//')"
	PACKAGE_WITHVERSION="$PACKAGE"

	# if not versionned, we skip directly to outputting $PACKAGE
	if echo "$INSTALLPKG" | grep '[(]' > /dev/null; then
	    # package versions returned by APT, in reversed order
	    PACKAGEVERSIONS="$( package_versions "$PACKAGE" | tac | xargs )"
	    CANDIDATE_VERSION="$( candidate_version "$PACKAGE" )"

	    COMPARESTRING="$(echo "$INSTALLPKG" | tr "/" " " | sed 's/^.*( *\(<<\|<=\|>=\|=\|<\|>>\|>\) *\(.*\)).*$/\1/')"
	    DEPSVERSION="$(echo "$INSTALLPKG" | tr "/" " " | sed 's/^.*( *\(<<\|<=\|>=\|=\|<\|>>\|>\) *\(.*\)).*$/\2/')"
	    # if strictly versionned, we skip to outputting that version
	    if [ "=" = "$COMPARESTRING" ]; then
		PACKAGE_WITHVERSION="$PACKAGE=$DEPSVERSION"
	    else
		# try the candidate version, then all available versions (asc)
		for VERSION in $CANDIDATE_VERSION $PACKAGEVERSIONS; do
		    if dpkg --compare-versions "$VERSION" "$COMPARESTRING" "$DEPSVERSION"; then
			if [ $VERSION != $CANDIDATE_VERSION ]; then
			    PACKAGE_WITHVERSION="$PACKAGE=$VERSION"
			fi
			break;
		    fi
		done
	    fi
	fi

	echo "$PACKAGE_WITHVERSION"
}

print_help() {
    # print out help message
    cat <<EOF
pbuilder-satisfydepends -- satisfy dependencies
Copyright 2002-2007  Junichi Uekawa <dancer@debian.org>

--help:        give help
--control:     specify control file (debian/control, *.dsc)
--chroot:      operate inside chroot
--binary-all:  include binary-all
--binary-arch: include binary-arch only
--echo:        echo mode, do nothing. (--force-version required for most operation)
--force-version: skip version check.
--continue-fail: continue even when failed.

EOF
}




#   pbuilder -- personal Debian package builder
#   Copyright (C) 2001,2002,2003,2005-2007 Junichi Uekawa
#   Copyright (C) 2007 Loïc Minier
#
# module to satisfy build dependencies; aptitude flavor

#export PBUILDER_PKGLIBDIR="${PBUILDER_PKGLIBDIR:-$PBUILDER_ROOT/usr/lib/pbuilder}"

#. "$PBUILDER_PKGLIBDIR"/pbuilder-satisfydepends-funcs


# filter out dependencies sent on input not for this arch; deps can have
# multiple lines; output is on a single line or "" if empty
function filter_arch_deps() {
    local arch="$1"
    local INSTALLPKGMULTI
    local INSTALLPKG

    # split on ","
    sed 's/[[:space:]]*,[[:space:]]*/\n/g' |
    while read INSTALLPKGMULTI; do
        echo "$INSTALLPKGMULTI" |
            # split on "|"
            sed 's/[[:space:]]*|[[:space:]]*/\n/g' |
            while read INSTALLPKG; do
                if echo "$INSTALLPKG" | grep -q '\['; then
                    if checkbuilddep_archdeps "$INSTALLPKG" "$ARCH"; then
                        continue
                    fi
                fi
                # output the selected package
                echo "$INSTALLPKG"
            done |
            # remove the arch list and add " | " between entries
            sed 's/\[.*\]//; $,$! s/$/ |/' |
            xargs --no-run-if-empty
    done |
    # add ", " between entries
    sed '$,$! s/$/,/' |
    xargs --no-run-if-empty
}

function checkbuilddep_internal () {
# Use this function to fulfill the dependency (almost)
    local ARCH=$($CHROOTEXEC dpkg-architecture -qDEB_HOST_ARCH)
    local BUILD_DEP_DEB_DIR
    local BUILD_DEP_DEB_CONTROL
    local DEPENDS
    local CONFLICTS
    echo " -> Attempting to satisfy build-dependencies"
    DEPENDS="$(get_build_deps | filter_arch_deps "$ARCH")"
    CONFLICTS="$(get_build_conflicts | filter_arch_deps "$ARCH")"
    echo " -> Creating pbuilder-satisfydepends-dummy package"
    BUILD_DEP_DEB_DIR="/tmp/satisfydepends-aptitude"
    BUILD_DEP_DEB_CONTROL="$BUILD_DEP_DEB_DIR/pbuilder-satisfydepends-dummy/DEBIAN/control"
    $CHROOTEXEC mkdir -p "$BUILD_DEP_DEB_DIR/pbuilder-satisfydepends-dummy/DEBIAN/"
    $CHROOTEXEC sh -c "cat >\"$BUILD_DEP_DEB_CONTROL\"" <<EOF
Package: pbuilder-satisfydepends-dummy
Version: 0.invalid.0
Architecture: $ARCH
Maintainer: Debian Pbuilder Team <pbuilder-maint@lists.alioth.debian.org>
Description: Dummy package to satisfy dependencies with aptitude - created by pbuilder
 This package was created automatically by pbuilder to satisfy the
 build-dependencies of the package being currently built.
EOF
    if [ -n "$DEPENDS" ]; then
        $CHROOTEXEC sh -c "echo \"Depends: $DEPENDS\" >>\"$BUILD_DEP_DEB_CONTROL\""
    fi
    if [ -n "$CONFLICTS" ]; then
        $CHROOTEXEC sh -c "echo \"Conflicts: $CONFLICTS\" >>\"$BUILD_DEP_DEB_CONTROL\""
    fi
    $CHROOTEXEC sh -c "cat \"$BUILD_DEP_DEB_CONTROL\""
    $CHROOTEXEC sh -c "dpkg-deb -b \"$BUILD_DEP_DEB_DIR/pbuilder-satisfydepends-dummy\""
    $CHROOTEXEC dpkg \
	--force-depends \
	--force-conflicts \
	-i "$BUILD_DEP_DEB_DIR/pbuilder-satisfydepends-dummy.deb" || true
    $CHROOTEXEC aptitude \
	-y \
	--without-recommends -o APT::Install-Recommends=false \
	"${APTITUDEOPT[@]}" \
	-o Aptitude::ProblemResolver::StepScore=100 \
	-o "Aptitude::ProblemResolver::Hints::KeepDummy=reject pbuilder-satisfydepends-dummy :UNINST" \
	-o Aptitude::ProblemResolver::Keep-All-Level=55000 \
	-o Aptitude::ProblemResolver::Remove-Essential-Level=maximum \
	install \
	pbuilder-satisfydepends-dummy
    # check whether the aptitude's resolver kept the package
    if ! $CHROOTEXEC dpkg -l pbuilder-satisfydepends-dummy 2>/dev/null | grep -q ^ii; then
        echo "Aptitude couldn't satisfy the build dependencies"
        exit 1
    fi
    echo " -> Finished parsing the build-deps"
}


function print_help () {
    # print out help message
    cat <<EOF
pbuilder-satisfydepends -- satisfy dependencies
Copyright 2002-2007  Junichi Uekawa <dancer@debian.org>

--help:        give help
--control:     specify control file (debian/control, *.dsc)
--chroot:      operate inside chroot
--binary-all:  include binary-all
--binary-arch: include binary-arch only
--echo:        echo mode, do nothing. (--force-version required for most operation)
--force-version: skip version check.
--continue-fail: continue even when failed.

EOF
}

#. "$PBUILDER_PKGLIBDIR"/pbuilder-satisfydepends-checkparams




#   pbuilder -- personal Debian package builder
#   Copyright (C) 2001,2002,2003,2005-2007 Junichi Uekawa
#

#
# module to satisfy build dependencies; parse command line parameters


DEBIAN_CONTROL=debian/control
CHROOT=""
CHROOTEXEC=""
BINARY_ARCH="no"
FORCEVERSION=""
CONTINUE_FAIL="no"
CHROOTEXEC_AFTER_INTERNAL_CHROOTEXEC=no
ALLOWUNTRUSTED=no

while [ -n "$1" ]; do
    case "$1" in
	--control|-c)
	    DEBIAN_CONTROL="$2"
	    shift; shift
	    ;;

	# --chroot option and --internal-chrootexec options and --echo options somewhat conflict with each other.

	--chroot)
	    CHROOT="$2"
	    CHROOTEXEC="chroot $2 "
	    if [ ${CHROOTEXEC_AFTER_INTERNAL_CHROOTEXEC} = maybe ]; then
		echo '--chroot specified after --internal-chrootexec' >&2
		exit 1
	    fi
	    shift; shift
	    ;;
	--internal-chrootexec)
	    CHROOTEXEC="$2"
	    CHROOTEXEC_AFTER_INTERNAL_CHROOTEXEC=maybe
	    shift; shift 
	    ;;
	--echo)
	    CHROOTEXEC="echo $CHROOTEXEC"
	    CHROOTEXEC_AFTER_INTERNAL_CHROOTEXEC=maybe
	    shift
	    ;;

	--binary-all)
	    BINARY_ARCH="no"
	    shift
	    ;;
	--binary-arch)
	    BINARY_ARCH="yes"
	    shift
	    ;;
	--continue-fail)
	    CONTINUE_FAIL="yes"
	    shift
	    ;;
	--force-version)
	    FORCEVERSION="yes"
	    shift;
	    ;;
	--check-key)
	    ALLOWUNTRUSTED=no
	    shift;
	    ;;
	--allow-untrusted)
	    ALLOWUNTRUSTED=yes
	    shift;
	    ;;
	--help|-h|*)
	    print_help
	    exit 1
	    ;;
    esac
done

if [ $ALLOWUNTRUSTED = yes ]; then
	# Also duplicated in pbuilder-checkparams!
	# apt flag to accept untrusted packages
	APTGETOPT[${#APTGETOPT[@]}]='--force-yes'
	# aptitude flag to accept untrusted packages
	APTITUDEOPT[${#APTITUDEOPT[@]}]='-o'
	APTITUDEOPT[${#APTITUDEOPT[@]}]='Aptitude::CmdLine::Ignore-Trust-Violations=true'
fi

checkbuilddep_internal

