GNU Compiler Collection
=======================

This build of the GNU Compiler Collection includes front ends for C, C++,
Objective-C, Objective-C++ and Java, as well as libraries for these languages
(libstdc++, libgcj,...). GCC was originally written as the compiler for the
GNU operating system. The GNU system was developed to be 100% free software,
free in the sense that it respects the user's freedom.

This package is primarily intended to be used on Ubuntu 14.04 where GCC 4.9 is missing.

The commands are prefixed with `gcc4.9opt` and all files are installed into
directories that won't conflict with your default installation of GCC.

GCC is patched to enable the following behaviour:
 * link with `-z relro --hash-style=both --as-needed` by default
 * enable Fortify Source (`-D_FORTIFY_SOURCE=2`) for optimization levels > 0
 * turn on `-fstack-protector-strong -Wformat -Wformat-security` by default
   for C, C++, ObjC, ObjC++ and set `ssp-buffer-size` to 4
 * remove `-fstrict-aliasing` from `-O2` to use `-fno-strict-aliasing` by
   default

A copy of a recent version of the [GNU Binutils](https://www.gnu.org/software/binutils/) will be included too.
This copy will not conflict with your distributions default binutils.

Homepage: https://gcc.gnu.org/
