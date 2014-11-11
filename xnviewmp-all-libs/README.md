This script downloads XnViewMP for GNU/Linux and creates a proper
Debian package including all its libraries (I had problems with the phonon plugin
using the system libs only).

Simply run `./build.sh`

To install the build-dependencies run:

    sudo apt-get install chrpath debhelper imagemagick

