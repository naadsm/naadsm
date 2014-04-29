/** @file dll/config.h
 *
 * @author Aaron Reeves <Aaron.Reeves@colostate.edu><br>
 *   Animal Population Health Institute<br>
 *   College of Veterinary Medicine and Biomedical Sciences<br>
 *   Colorado State University<br>
 *   Fort Collins, CO 80523<br>
 * @version 0.1
 * @date June 2005
 *
 * Copyright &copy; APHI and Colorado State University, 2005
 *
 * This file has been modified by hand for Windows/MinGW
 * versions (exe and dll) of the North American Animal Disease Spread Model.
 * Linux/Unix builds should use config.h as generated by configure.
 *
 * <http://www.naadsm.org>
 *
 * This file is based on the following sources:
 * config.h.  Generated by configure.
 * config.h.in.  Generated from configure.in by autoheader.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#ifndef WIN_DLL
  /* Define to 1 to provide an option for debug output. */
#define DEBUG 1

  /* Define to 1 to provide an option for informational output. */
#define INFO 1
#else
  /* Define to 1 to provide an option for debug output. */
#define DEBUG 0

  /* Define to 1 to provide an option for informational output. */
#define INFO 0
#endif

/* Define to 1 if you have the `atan2' function. */
#define HAVE_ATAN2 1

/* Define to 1 if you have the <ctype.h> header file. */
#define HAVE_CTYPE_H 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 0

/* Define to 1 if you have the <errno.h> header file. */
#define HAVE_ERRNO_H 1

/* Define to 1 if you have the `getline' function. */
#define HAVE_GETLINE 1

/* Define to 1 if you have the `getstr' function. */
/* #undef HAVE_GETSTR */

/* Define to 1 if you have the <gmp.h> header file. */
#define HAVE_GMP_H 1

/* Define to 1 if you have the `g_strsplit_regexp' function. */
/* #undef HAVE_G_STRSPLIT_REGEXP */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the `gpcl' library (-lgpcl). */
#define HAVE_LIBGPCL 1

/* Define to 1 if you have the `m' library (-lm). */
#define HAVE_LIBM 1

/* Define to 1 if you have the `popt' library (-lpopt). */
#define HAVE_LIBPOPT 1

/* Define to 1 if you have the `rtree' library (-lrtree). */
#define HAVE_LIBRTREE 1

/* Define to 0 to never use the `rtree' library. 
 * Define to 1 to always use the `rtree' library.
 * Leave the symbol undefined to let the program choose. 
*/
//#define USE_RTREE 1

/* Define to 1 if you have the <ltdl.h> header file. */
#define HAVE_LTDL_H 0

/* Define to 1 if you have the <math.h> header file. */
#define HAVE_MATH_H 1

/* Define to 1 if you have the `memchr' function. */
#define HAVE_MEMCHR 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define this if the link test succeeded */
/* #undef HAVE_MPI */

/* Define to 1 if you have the <regex.h> header file. */
#define HAVE_REGEX_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the `strcasecmp' function. */
#define HAVE_STRCASECMP 1

/* Define to 1 if you have the `strdup' function. */
#define HAVE_STRDUP 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strndup' function. */
#define HAVE_STRNDUP 1

/* Define to 1 if you have the `strnlen' function. */
#define HAVE_STRNLEN 1

/* Define to 1 if you have the `strstr' function. */
#define HAVE_STRSTR 1

/* Define to 1 if you have the `strtod' function. */
#define HAVE_STRTOD 1

/* Define to 1 if you have the `strtol' function. */
#define HAVE_STRTOL 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Name of package */
#define PACKAGE "sim"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT ""

/* Define to the full name of this package. */
#define PACKAGE_NAME "sim"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "sim 0.1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "sim"

/* Define to the version of this package. */
#define PACKAGE_VERSION "0.1"

/* Define to use the simple SPRNG interface. */
#define SIMPLE_SPRNG 1

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if using the GNU multiple precision library. */
#define USE_GMP 1

/* Version number of package */
#define VERSION "0.1"

/* Define this if the link test failed. */
/* #undef WITHOUT_SPRNG */

/* Define to 1 if you have the SPRNG random number generator. */
#define WITH_SPRNG 1

/* Define to 1 if `lex' declares `yytext' as a `char *' by default, not a
   `char[]'. */
#define YYTEXT_POINTER 1

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `unsigned' if <sys/types.h> does not define. */
/* #undef size_t */
