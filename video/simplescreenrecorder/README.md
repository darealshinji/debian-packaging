SimpleScreenRecorder
====================

SimpleScreenRecorder is a feature-rich screen recorder that supports X11 and OpenGL.
It has a Qt-based graphical user interface. It can record the entire screen or part of it,
or record OpenGL applications directly. The recording can be paused and resumed at any time.
Many different file formats and codecs are supported.

To build the 32 bit simplescreenrecorder-lib package along with the rest on a 64 bit system, run the following:
`make PBUILDER=1 SUMMARY=0 && make PBUILDER=1 ARCH=i386`

Homepage: http://www.maartenbaert.be/simplescreenrecorder/

