Download and package the latest pre-compiled Qt libraries.
Those libraries will be installed into a separate subdirectory to prevent any conflicts with system libraries.
A symbolic link into `/opt` will be created too.
Use the `LD_LIBRARY_PATH` environment variable if you want a program to use the newer libraries (see `man ld-linux.so` for more information).
