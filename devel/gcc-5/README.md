GNU Compiler Collection
=======================

This build of the GNU Compiler Collection includes front ends for C, C++,
Objective-C, Objective-C++ and Java, as well as libraries for these languages
(libstdc++, libgcj,...). GCC was originally written as the compiler for the
GNU operating system. The GNU system was developed to be 100% free software,
free in the sense that it respects the user's freedom.

The commands are prefixed with `gcc5opt` and all files are installed into
directories that won't conflict with your default installation of GCC.

Additionally to gcc5opt-g++ there's an alternative command `gcc5opt-g++-static-libstdc++`,
configured to link libstdc++ statically.

GCC is patched to enable the following behaviour:
 * link with `--as-needed` and `-z relro` by default
 * enable Fortify Source (`-D_FORTIFY_SOURCE=2`) for optimization levels > 0
 * turn on `-fstack-protector-strong -Wformat -Wformat-security` by default
   for C, C++, ObjC, ObjC++ and set `ssp-buffer-size` to 4
 * remove `-fstrict-aliasing` from `-O2` to use `-fno-strict-aliasing` by
   default

Homepage: https://gcc.gnu.org/
