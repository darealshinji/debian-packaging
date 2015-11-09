AC_INIT([PatchELFmod],
        m4_esyscmd([printf $(cat ./version)]),
        [https://github.com/darealshinji/patchelfmod])

AM_CONFIG_HEADER([config.h])
AC_CONFIG_SRCDIR([src/patchelfmod.cpp])

AC_CONFIG_AUX_DIR([build-aux])
AM_PROG_CC_C_O
AM_INIT_AUTOMAKE([dist-bzip2 dist-xz foreign color-tests parallel-tests])

# Checks for programs.
AC_CHECK_PROG(STRIP, strip, [$(which strip) --verbose])
AC_CHECK_PROG(MD5SUM, md5sum, [$(which md5sum)])  # used for tests/backup.sh
AC_CHECK_PROG(MD5, md5, [$(which md5)])
AC_PROG_CXX
AC_PROG_LN_S
AC_PROG_MAKE_SET

# Checks for libraries.
AC_CHECK_HEADERS([attr/libattr.h attr/error_context.h])
AC_SEARCH_LIBS([attr_copy_file], [attr])
AC_CHECK_FUNCS([attr_copy_file])

AC_CHECK_HEADERS([sys/acl.h acl/libacl.h])
AC_SEARCH_LIBS([perm_copy_file], [acl])
AC_CHECK_FUNCS([perm_copy_file])

AC_CONFIG_FILES([Makefile \
                 src/Makefile \
                 tests/Makefile \
                 man/patchelfmod.1 \
                 patchelfmod.spec
                 ])
AC_OUTPUT
