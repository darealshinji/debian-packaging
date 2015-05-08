include ../../mk/include.mk

deps       = wget
srcfiles   = NuGet.exe
cleanfiles = $(srcfiles)

changelog-msg = New release version
pkgs-config   = https://raw.githubusercontent.com/NuGet/NuGet.CommandLine/release/src/NuGet.CommandLine/packages.config
VERSION = $(shell wget -q -O - $(pkgs-config) | grep 'NuGet.Core' | tr ' ' '\n' | grep 'version' | cut -d'"' -f2)

download:
	@ $(call download,NuGet.exe,http://nuget.org/nuget.exe)
	@ VERSION=$(VERSION); $(changelog-entry)

