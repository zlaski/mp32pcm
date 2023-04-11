/*
    Copyright 2005 Martin Ruckert
    
    ruckertm@acm.org

    This file is part of mp32pcm.

    mp32pcm is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.

    mp32pcm is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with mp32pcm; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*/

#include <stdio.h>                                                   /* 450 */
#include <ctype.h>
#include "mp32pcm.h"
int
hex_read (int id, void *buffer, size_t size)
{
  char hex[3];

  int c, i = 0;

  unsigned int b;

  hex[2] = 0;
  while (i < (int) size) {
    do
      if (EOF == (c = getchar ()))
        return i;
    while (!isxdigit (c));
    hex[0] = c;
    hex[1] = (char) getchar ();
    sscanf (hex, "%x", &b);
    (((unsigned char *) buffer)[i++]) = b;
  }
  return i;
}

static unsigned mask =
  ((unsigned) -1) >> ((sizeof (unsigned) - sizeof (mp3_sample)) * 8);
void
hex_write (mp3_sample * buffer, int size)
{
  int i = 0;

  while (i < size)
    printf ("%0*X" "\n", (int) sizeof (mp3_sample) * 2, buffer[i++] & mask);
}

int
main (void)
{
  int id, size;

  mp3_sample buffer[MP3_MIN_BUFFER];

  if ((id = mp3_open (hex_read, NULL)) < 0)
    return 1;
  while ((size = mp3_read (id, buffer, MP3_MIN_BUFFER)) > 0)
    hex_write (buffer, size);
  if (mp3_close (id) < 0)
    return 1;
  return 0;
}
