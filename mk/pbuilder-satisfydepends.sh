#!/bin/bash
# pbuilder version 0.229
set -e
here="$(dirname "$(readlink -f "$0")")"
export PBUILDER_PKGLIBDIR="$here"
source "$here/pbuilder-modules"
source "$here/pbuilder-satisfydepends-funcs"
source "$here/pbuilder-satisfydepends-aptitude"
source "$here/pbuilder-satisfydepends-checkparams"
