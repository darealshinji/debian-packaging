#!/bin/sh

cd "$(dirname "$0")"

compiler="g++ g++-5 gcc5opt-g++ g++-6 gcc6opt-g++ clang++ c++"

echo ""
for cxx in $compiler ; do
  printf "check for $cxx ... "
  if which $cxx 2>/dev/null >/dev/null ; then
    echo "found"
    printf "check if $cxx supports -std=c++14 ... "
    if $cxx -c -std=c++14 stdcxx14_test.cpp 2>/dev/null >/dev/null ; then
      echo "yes"
      printf "check if $cxx supports -std=gnu++14 ... "
      if $cxx -c -std=gnu++14 stdcxx14_test.cpp 2>/dev/null >/dev/null ; then
        echo "yes"
        std="gnu"
      else
        echo "no"
        std="c"
      fi
      stdflag="-std=${std}++14"
      break
    else
      echo "no"
      cxx=""
    fi
  else
    echo "not found"
    cxx=""
  fi
done
if test "x$cxx" = "xgcc5opt-g++" -o "x$cxx" = "xgcc6opt-g++" ; then
  extra_ldflags="-static-libgcc -static-libstdc++"
fi
rm -f stdcxx14_test.o

if test "x$cxx" = "x" ; then
  echo "error: no C++14 compiler found"
  exit 1
fi

cat <<EOF> ../debian/config.mak
cxx_ = $cxx
std = $stdflag
xldflags = $extra_ldflags
EOF

echo ""
echo "  C++14 compiler...: $cxx"
echo "  std flag.........: $stdflag"
echo "  extra ldflags....: $extra_ldflags"
echo ""

