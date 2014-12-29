FMOD Ex
=======

FMOD is a closed-source cross platform audio library and toolset to let
you easily implement the latest audio technologies into your title.

This script downloads the FMOD Ex libraries for GNU/Linux and creates Debian packages.
Since the libraries are missing sonames and have uncommon filenames, they will be saved
as private libs to avoid trouble with the system.

Simply run `./build.sh`

To install the build-dependencies run:<br>
`sudo apt-get install debhelper fakeroot`

Homepage: http://www.fmod.org/
