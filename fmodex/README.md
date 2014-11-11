FMOD Ex
=======

FMOD is a closed-source cross platform audio library and toolset to let
you easily implement the latest audio technologies into your title.

This script downloads the FMOD Ex libraries for GNU/Linux and creates Debian packages.
The libraries' headers will be patched so that they can be packaged properly.

Simply run `./build.sh`

To install the build-dependencies run:<br>
`sudo apt-get install automake build-essential debhelper fakeroot`

Homepage: http://www.fmod.org/

PatchELFmod homepage: https://github.com/darealshinji/patchelfmod
