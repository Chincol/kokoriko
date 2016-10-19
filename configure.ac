#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([kokoriko], [0.0.1], [kokoriko@ceci-nest-pas.me])

# Checks for programs.
AC_CHECK_PROG([BASH], [bash], [yes])
AC_CHECK_PROG([FFMPEG],[ffmpeg],[yes])
AS_IF([test x"${BASH}" != x"yes"],
	[AC_MSG_ERROR([Please install bash before installing kokoriko])])
AS_IF([test x"${FFMPEG}" != x"yes"],
	[AC_MSG_ERROR([Please install ffmpeg before installing kokoriko])])


# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_OUTPUT
