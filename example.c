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

#include <unistd.h>                                                  /*  17 */
#include "mp32pcm.h"
#define BUFSIZE (4*MP3_MIN_BUFFER)
int
main (void)
{
  int id;

  mp3_sample buffer[BUFSIZE];

  int size;

  id = mp3_open (read, NULL);
  if (id < 0)
    return 1;
  while ((size = mp3_read (id, buffer, BUFSIZE)) > 0)
    write (1, buffer, size * sizeof (mp3_sample));
  if (mp3_close (id) < 0)
    return 1;
  return 0;
}
