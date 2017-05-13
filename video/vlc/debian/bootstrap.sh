#!/bin/sh
set -e
set -v
autoreconf -if libdvdcss
autoreconf -if libdvdnav
autoreconf -if libdvdread
cd vlc && ./bootstrap
