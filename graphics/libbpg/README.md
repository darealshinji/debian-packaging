libbpg
======

BPG (Better Portable Graphics) is an image format whose purpose is to
replace the JPEG image format when quality or file size is an issue.

Its main advantages are:
 * High compression ratio. Files are much smaller than JPEG for similar quality.
 * Supported by most Web browsers with a small Javascript decoder.
 * Based on a subset of the HEVC open video compression standard.
 * Supports the same chroma formats as JPEG (grayscale, YCbCr 4:2:0,
   4:2:2, 4:4:4) to reduce the losses during the conversion. An alpha
   channel is supported. The RGB, YCgCo and CMYK color spaces are also
   supported.
 * Native support of 8 to 14 bits per channel for a higher dynamic range.
 * Lossless compression is supported.
 * Various metadata (such as EXIF, ICC profile, XMP) can be included.

This Makefile will create three Debian packages:
 * libbpg-bin: tools for manipulating BPG image format files, statically
   linked against libpng16, since that version is not available in Debian or
   Ubuntu and installation is easier this way.
 * libbpg-dev: static library and header files for development.
 * libpng16-dev: required by libbpg-dev.
 * libjs-bpgdec: Javascript decoding library for BPG images, including an
   example. It's available as a virtual package via libbpg-bin and libbpg-dev.
   You can find the files in their documentation directories.

libbpg homepage: http://www.bellard.org/bpg/<br>
libpng homepage: http://www.libpng.org/pub/png/libpng.html<br>
x265 homepage: https://bitbucket.org/multicoreware/x265/

