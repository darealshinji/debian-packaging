#!/bin/sh
set -v
set -e
autoreconf -if libdvdcss
autoreconf -if libdvdnav
autoreconf -if libdvdread
cd vlc && ./bootstrap
