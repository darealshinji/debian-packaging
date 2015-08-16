#!/bin/sh

find */* -maxdepth 0 -type d | grep -v -e 'mk/patchelfmod'
printf "\n`find */* -maxdepth 0 -type d | grep -v -e 'mk/patchelfmod' | wc -l` packages\n\n"
