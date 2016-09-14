/*
** I, djcj <djcj@gmx.de>, hereby release this code to the Public Domain.
** No license required for any purpose; the work is not subject to
** copyright in any jurisdiction.
*/

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
  const char *command = GCCDRIVER;

  if (argc == 1)
  {
    printf("gcc/g++ wrapper\n"
           "Used driver: " GCCDRIVER "\n"
           "Appends arguments:" XARGS "\n"
           "Usage: %s args\n", argv[0]);
    return 1;
  }
  else if (argc > 1)
  {
    std::string args = std::string(argv[argc-1]);
    std::string str = GCCDRIVER " " + args + XARGS;
    command = str.c_str();
  }

  return system(command);
}

