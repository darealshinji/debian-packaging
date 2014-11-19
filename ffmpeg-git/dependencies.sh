#!/bin/bash

deps="wget texi2html yasm zlib1g-dev"

alldeps="\
 frei0r-plugins-dev \
 libasound2-dev \
 libass-dev \
 libbluray-dev \
 libbz2-dev \
 libcdio-cdda-dev \
 libcdio-dev \
 libcdio-paranoia-dev \
 libdc1394-22-dev \
 libfreetype6-dev \
 libgnutls-dev \
 libgsm1-dev \
 libimlib2-dev \
 libjack-dev \
 liblzo2-dev \
 libmp3lame-dev \
 libfdk-aac-dev \
 libopencore-amrnb-dev \
 libopencore-amrwb-dev \
 libopenjpeg-dev \
 libopus-dev \
 libpulse-dev \
 libraw1394-dev \
 librtmp-dev \
 libschroedinger-dev \
 libsdl1.2-dev \
 libspeex-dev \
 libtheora-dev \
 libtiff-dev \
 libva-dev \
 libvdpau-dev \
 libvo-aacenc-dev \
 libvo-amrwbenc-dev \
 libvorbis-dev \
 libvpx-dev \
 libwavpack-dev \
 libx11-dev \
 libx264-dev \
 libx265-dev \
 libxext-dev \
 libxfixes-dev \
 libxvidcore-dev \
 libxvmc-dev \
 texi2html \
 yasm \
 zlib1g-dev"

while true; do
    echo "Do you wish to install ALL build dependencies?"
    read -p "This enables more codecs and is recommended. [y/n] " yn
    case $yn in
        [Yy]* )
          echo -e "\nInstalling the following dependencies:\n$alldeps\n";
          sudo apt-get install $alldeps;
          break;;
        [Nn]* )
          echo -e "\nInstalling the following dependencies:\n$deps\n";
          sudo apt-get install $deps;
          break;;
        * ) echo "Please answer yes or no.";;
    esac
done

