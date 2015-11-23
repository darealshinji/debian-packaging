#!/bin/sh

find */* -maxdepth 0 -type d | grep -v -e '^mk/'
printf "\n`find */* -maxdepth 0 -type d | grep -v -e '^mk/' | wc -l` packages\n\n"
