GZDoom
======

GZDoom is a doom engine. It's a ZDoom fork using OpenGL.

This script downloads the current Git version and creates a Debian package.
GZDoom requires the FMOD ex library, which will be automatically downloaded
and included in the package.

Simply run `./build.sh`

To install the build-dependencies run:<br>
`sudo apt-get install debhelper cmake libbz2-dev libfluidsynth-dev libglew-dev libgtk2.0-dev libjpeg-dev libsdl1.2-dev zlib1g-dev`

GZDoom code: https://github.com/coelckers/gzdoom
