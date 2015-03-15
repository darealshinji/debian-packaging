Yasm-NextGen
============

This project is a translation of the Yasm mainline C code into ANSI/ISO C++.
It's currently somewhat of an experimental project, so a number of features
present in the mainline version of yasm are not yet implemented.  Also, it's
likely that the code may change drastically with little notice.

Major things that work:
  * GNU AS syntax (more complete than mainline)
  * NASM basic syntax (no preprocessor)
  * Most object files (ELF, Win32/64)
  * DWARF2 debug info

Major things that don't work / don't exist:
  * NASM preprocessor
  * Mach-O object files
  * List file output

Some interesting things being worked on:
  * "ygas" frontend - dropin replacement for GNU AS
  * "ygas" branch - configure based, stripped down distribution for the above
  * "ygas-c" branch - backtranslation to C of the above for improved
    portability
  * yobjdump - dropin replacement for GNU objdump

Homepage: https://github.com/yasm/yasm-nextgen

