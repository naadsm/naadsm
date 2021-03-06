/* Find the length of STRING, but scan at most MAXLEN characters.
   Copyright (C) 1996, 1997, 1998, 2000, 2001 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public License as
   published by the Free Software Foundation; either version 2 of the
   License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with the GNU C Library; see the file COPYING.LIB.  If not,
   write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

#if HAVE_CONFIG_H
#  include "config.h"
#endif

#if HAVE_STRING_H
#  if !STDC_HEADERS && HAVE_MEMORY_H
#    include <memory.h>
#  endif
#  include <string.h>
#else
#  include <strings.h>
#endif

#if !HAVE_MEMCHR
/* If memchr is not found at configure time, a fallback implementation will go
 * into libreplace, and we need a prototype here. */
char *memchr (const char *s, int c, size_t n);
#endif

#undef __strnlen
#undef strnlen

#ifndef weak_alias
#  define __strnlen strnlen
#endif

/* Find the length of STRING, but scan at most MAXLEN characters.
   If no '\0' terminator is found in that many characters, return MAXLEN.  */

size_t
__strnlen (const char *string, size_t maxlen)
{
  const char *end = memchr (string, '\0', maxlen);
  return end ? (size_t) (end - string) : maxlen;
}

#ifdef weak_alias
weak_alias (__strnlen, strnlen)
#endif
