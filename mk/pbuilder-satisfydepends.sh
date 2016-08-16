#! /bin/bash

# pbuilder -- personal Debian package builder
# version 0.225.2

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
###############################################################################

set -e

#   pbuilder -- personal Debian package builder
#   Copyright (C) 2001-2007 Junichi Uekawa <dancer@debian.org>
#   Copyright (C) 2007 Loïc Minier <lool@dooz.org>
#   Copyright (C) 2015 Mattia Rizzolo <mattia@debian.org>
#
# module to satisfy build dependencies; common functions


function package_versions() {
    local PACKAGE="$1"
    LC_ALL=C $CHROOTEXEC apt-cache show "$PACKAGE" | sed -n 's/^Version: //p'
}

function candidate_version() {
    local PACKAGE="$1"
    LC_ALL=C $CHROOTEXEC apt-cache policy "$PACKAGE" | sed -n 's/ *Candidate: //p'
}

function get_source_control_field() {
    local field="$1"

    sed -n -e "s/^$field://i" -e '
t store
/^-----BEGIN PGP SIGNED MESSAGE-----$/ {
    : pgploop
    n
    /^$/ d
    b pgploop
}
: leadloop
/^[ \t]*$/ {
    n
    /^$/ d
    b leadloop
}
/^#/ {
    n
    /^$/ d
    b leadloop
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

function get_build_deps() {
    local output

    output="$(get_source_control_field "Build-Depends")"
    output="${output%, }"
    case "$BINARY_ARCH" in
        any)
            output="${output:+$output, }$(get_source_control_field "Build-Depends-Indep")"
            output="${output%, }"
            output="${output:+$output, }$(get_source_control_field "Build-Depends-Arch")"
            output="${output%, }"
            ;;
        binary)
            output="${output:+$output, }$(get_source_control_field "Build-Depends-Arch")"
            output="${output%, }"
            ;;
        all)
            output="${output:+$output, }$(get_source_control_field "Build-Depends-Indep")"
            output="${output%, }"
            ;;
    esac
    echo "$output"
}

function get_build_conflicts() {
    local output

    output="$(get_source_control_field "Build-Conflicts")"
    output="${output%, }"
     case "$BINARY_ARCH" in
        any)
            output="${output:+$output, }$(get_source_control_field "Build-Conflicts-Indep")"
            output="${output%, }"
            output="${output:+$output, }$(get_source_control_field "Build-Conflicts-Arch")"
            output="${output%, }"
            ;;
        binary)
            output="${output:+$output, }$(get_source_control_field "Build-Conflicts-Arch")"
            output="${output%, }"
            ;;
        all)
            output="${output:+$output, }$(get_source_control_field "Build-Conflicts-Indep")"
            output="${output%, }"
            ;;
    esac
    echo "$output"
}

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
                    if checkbuilddep_archdeps "$INSTALLPKG" "$arch"; then
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

# filter out dependencies sent on input not for selected build profiles; deps
# can have multiple lines; output is on a single line or "" if empty
function filter_restriction_deps() {
    local profiles="$1"
    local INSTALLPKGMULTI
    local INSTALLPKG

    # split on ","
    sed 's/[[:space:]]*,[[:space:]]*/\n/g' |
    while read INSTALLPKGMULTI; do
        echo "$INSTALLPKGMULTI" |
            # split on "|"
            sed 's/[[:space:]]*|[[:space:]]*/\n/g' |
            while read INSTALLPKG; do
                if echo "$INSTALLPKG" | grep -q '<'; then
                    if checkbuilddep_restrictiondeps "$INSTALLPKG" "$profiles"; then
                        continue
                    fi
                fi
                # output the selected package
                echo "$INSTALLPKG"
            done |
            # remove the restriction list and add " | " between entries
            sed 's/<.*>//; $,$! s/$/ |/' |
            xargs --no-run-if-empty
    done |
    # add ", " between entries
    sed '$,$! s/$/,/' |
    xargs --no-run-if-empty
}

function checkbuilddep_archdeps() {
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
            d="$(echo "$d" | sed 's/!//')"
            if dpkg-architecture -a"$ARCH" -i"$d" -f; then
                IGNORE_IT="yes"
            fi
        else
            if dpkg-architecture -a"$ARCH" -i"$d" -f; then
                USE_IT="yes"
            fi
            INCLUDE="yes"
        fi
    done
    if [ $IGNORE_IT ] && [ $USE_IT ]; then
        printf "W: inconsistent arch restriction on %s: "  "$PKG" >&2
        printf "%s depedency\n" "$DEP_ARCHES" >&2
    fi
    if [ $IGNORE_IT ] || ( [ $INCLUDE ] && [ ! $USE_IT ] ); then
        return 0
    fi
    return 1
}

function checkbuilddep_restrictiondeps() {
    # returns FALSE on INSTALL
    local INSTALLPKG="$1"
    local PROFILES="$2"
    # restrictions listed between < and > for this dep
    local DEP_RESTRICTIONS="$(echo "$INSTALLPKG" | sed -e 's/[^<]*<\(.*\)>.*/\1/' -e 's/>\s\+</;/g')"
    local PKG="$(echo "$INSTALLPKG" | cut -d ' ' -f 1)"
    local SEEN_PROFILE
    local PROFILE
    local NEGATED
    local FOUND
    if [ "$DEP_RESTRICTIONS" = "$INSTALLPKG" ]; then
        # there is not a build profile, rather it's a version costraint
        return 1
    fi
    IFS=';' read -ra RESTRLISTS <<< "$DEP_RESTRICTIONS"
    for restrlist in "${RESTRLISTS[@]}"; do
        SEEN_PROFILE="yes"
        for restr in $restrlist; do
            if [[ "$restr" == '!'* ]]; then
                NEGATED="yes"
                PROFILE=${restr#!}
            else
                NEGATED="no"
                PROFILE=${restr}
            fi
            FOUND="no"
            for p in $PROFILES; do
                if [ "$p" = "$PROFILE" ]; then
                    FOUND="yes"
                    break
                fi
            done
            if [ "$FOUND" = "$NEGATED" ]; then
                SEEN_PROFILE="no"
                break
            fi
        done

        if [ "$SEEN_PROFILE" = "yes" ]; then
            return 1
        fi
    done
    return 0
}




#   pbuilder -- personal Debian package builder
#   Copyright (C) 2001-2007 Junichi Uekawa <dancer@debian.org>
#   Copyright (C) 2007 Loïc Minier <lool@dooz.org>
#
# module to satisfy build dependencies; aptitude flavor


function checkbuilddep_internal () {
# Use this function to fulfill the dependency (almost)
    local ARCH=$($CHROOTEXEC dpkg-architecture -qDEB_HOST_ARCH)
    local BUILD_DEP_DEB_DIR
    local BUILD_DEP_DEB_CONTROL
    local DEPENDS
    local CONFLICTS
    echo " -> Attempting to satisfy build-dependencies"
    DEPENDS="$(get_build_deps | filter_arch_deps "$ARCH" |
        filter_restriction_deps "$DEB_BUILD_PROFILES" )"
    CONFLICTS="$(get_build_conflicts | filter_arch_deps "$ARCH" |
        filter_restriction_deps "$DEB_BUILD_PROFILES" )"
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
    $CHROOTEXEC env XDG_CACHE_HOME=/root aptitude \
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

--help              give help
--control           specify control file (debian/control, *.dsc)
--chroot            operate inside chroot
--binary-all        include binary-all
--binary-arch       include binary-arch only
--binary-indep      include binary-indep only
--eatmydata         wrap the chroots commands with eatmydata

Debugging options:
--force-version     skip version check.
--continue-fail     continue even when failed.
--internal-chrootexec specify the command to execute instead of \`chroot\`
--echo              echo mode, do nothing. (--force-version required for most operation)

EOF
}




#   pbuilder -- personal Debian package builder
#   Copyright (C) 2001-2007 Junichi Uekawa <dancer@debian.org>
#
# module to satisfy build dependencies; parse command line parameters


DEBIAN_CONTROL=debian/control
CHROOT=""
CHROOTEXEC=""
BINARY_ARCH="any"
FORCEVERSION=""
CONTINUE_FAIL="no"
CHROOTEXEC_AFTER_INTERNAL_CHROOTEXEC=no
ALLOWUNTRUSTED=no
EATMYDATA=no

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
	    BINARY_ARCH="any"
	    shift
	    ;;
	--binary-arch)
	    BINARY_ARCH="binary"
	    shift
	    ;;
	--binary-indep)
	    BINARY_ARCH="all"
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
	--eatmydata)
	    EATMYDATA=yes
	    shift
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

if [ "$EATMYDATA" = "yes" ]; then
	CHROOTEXEC="$CHROOTEXEC eatmydata"
fi

checkbuilddep_internal

