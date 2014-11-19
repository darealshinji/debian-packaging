#!/bin/bash

deps="\
 git \
 wget \
 docbook-xml \
 docbook-xsl \
 ladspa-sdk \
 libaa1-dev \
 libasound2-dev \
 libass-dev \
 libaudio-dev \
 libbluray-dev \
 libcaca-dev \
 libcdparanoia-dev \
 libdirectfb-dev \
 libdts-dev \
 libdvdnav-dev \
 libdvdread-dev \
 libenca-dev \
 libesd0-dev \
 libfaad-dev \
 libfontconfig1-dev \
 libfreetype6-dev \
 libfribidi-dev \
 libgif-dev \
 libgl1-mesa-dev \
 libgtk2.0-dev \
 libjack-dev \
 libjpeg-dev \
 liblircclient-dev \
 liblivemedia-dev \
 liblzo2-dev \
 libmp3lame-dev \
 libmpcdec-dev \
 libmpeg2-4-dev \
 libncurses5-dev \
 libopenal-dev \
 libpng-dev \
 libpulse-dev \
 libschroedinger-dev \
 libsdl1.2-dev \
 libsmbclient-dev \
 libspeex-dev \
 libsvga1-dev \
 libtheora-dev \
 libvdpau-dev \
 libvorbis-dev \
 libvorbisidec-dev \
 libx11-dev \
 libx264-dev \
 libx265-dev \
 libxext-dev \
 libxinerama-dev \
 libxv-dev \
 libxvidcore-dev \
 libxvmc-dev \
 libxxf86dga-dev \
 libxxf86vm-dev \
 pkg-config \
 vstream-client-dev \
 x11proto-core-dev \
 xsltproc \
 yasm \
 zlib1g-dev"

while true; do
    echo "Do you wish to install the following build dependencies:"
    read -p "$deps ? [y/n] " yn
    case $yn in
        [Yy]* )
          for d in $deps ; do (sudo apt-get -y install $d || true); done;
          break;;
        [Nn]* ) exit;;
        * ) exit;;
    esac
done

