#!/bin/sh
fakeroot debian/rules override_dh_clean
rm -rf build.log patchelfmod OculusSDK
