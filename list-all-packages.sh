#!/bin/sh

find */* -maxdepth 0 -type d
printf "\n`find */* -maxdepth 0 -type d | wc -l` packages\n\n"
