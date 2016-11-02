/*
** I, djcj <djcj@gmx.de>, hereby release this code to the Public Domain.
** No license required for any purpose; the work is not subject to
** copyright in any jurisdiction.
*/

#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>

#ifndef GCCDRIVER
# define GCCDRIVER "gcc6opt-gcc"
#endif

#ifndef XARGS
# ifndef STATIC
#  define STATIC 1
# endif
# if (STATIC == 1)
#  define XARGS " -static-libgcc"
# elif (STATIC == 2)
#  define XARGS " -static-libstdc++"
# elif (STATIC == 3)
#  define XARGS " -static-libgcc -static-libstdc++"
# else
#  define XARGS " "
# endif
#endif


int main(int argc, char **argv)
{
  std::string command = GCCDRIVER;

  if (argc == 1)
  {
    std::cerr << "gcc/g++ wrapper\n"
      << "Used driver: " GCCDRIVER "\n"
      << "Appends arguments:" XARGS "\n"
      << "Usage: " << argv[0] << " args"
      << std::endl;
    return 1;
  }
  else if (argc > 1)
  {
    std::string args;
    for (int i = 1; i < argc; ++i)
    {
      args = args + " " + std::string(argv[i]);
    }
    command = GCCDRIVER " " + args + XARGS;
  }

  return system(command.c_str());
}

