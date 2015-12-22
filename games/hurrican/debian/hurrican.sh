#!/bin/sh

# wrapper script to force the log file being saved in ~/.hurrican
logdir="$HOME/.hurrican"

mkdir -p "$logdir"
cd "$logdir" && hurrican.real "$@"

