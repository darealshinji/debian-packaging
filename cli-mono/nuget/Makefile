include ../../mk/include.mk

deps       = wget
srcfiles   = NuGet.exe
cleanfiles = $(srcfiles) debian/changelog

changelog-msg = New release version
VERSION = $(shell wget -q -O - https://raw.githubusercontent.com/NuGet/NuGet.CommandLine/release/src/NuGet.CommandLine/packages.config | \
		grep 'NuGet.Core' | tr ' ' '\n' | grep 'version' | cut -d'"' -f2)

download:
	@ $(call download,NuGet.exe,http://nuget.org/nuget.exe)
	VERSION=$(VERSION); $(changelog-entry)

