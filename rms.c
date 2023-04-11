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

#include <stdlib.h>                                                  /* 451 */
#include <stdio.h>
#include <ctype.h>
#include <math.h>
int
main (int argc, char *argv[])
{
  FILE *f1, *f2;

  char l1[80], l2[80], *r1, *r2;

  double s0 = 0.0, s1 = 0.0;

  int maxsample1 = 0, maxsample2 = 0, ch = 0, maxdiff = 0, channels =
    0, diffcount = 0, count = 0, maxcount = 0;
  double diff_limit = 1.0 / (1 << 14);

  double scale = 1.0 / ((1 << (sizeof (int) * 8 - 2)) * 2.0);

  double rms_limit = 1.0 / ((1 << 15) * sqrt (12.0));

  if (argc < 3)
    return printf ("use rms file1 file2\n");
  if ((channels = atoi (argv[1])) < 1)
    return printf ("number of channels expected %s\n", argv[1]);
  if (NULL == (f1 = fopen (argv[2], "r")))
    return printf ("unable to open %s\n", argv[2]);
  if (NULL == (f2 = fopen (argv[3], "r")))
    return printf ("unable to open %s\n", argv[3]);
  while (r1 = fgets (l1, 80, f1), r2 = fgets (l2, 80, f2), r1 != NULL
         && r2 != NULL) {
    int i, x1, x2, diff;                                             /* 452 */

    if (r1 != NULL) {
      sscanf (l1, "%x", &x1);
      for (i = 0; isxdigit (l1[i]); i++)
        continue;
      x1 = (x1 << (sizeof (int) * 8 - i * 4));
    }
    else
      x1 = 0;
    if (r2 != NULL) {
      sscanf (l2, "%x", &x2);
      for (i = 0; isxdigit (l2[i]); i++)
        continue;
      x2 = (x2 << (sizeof (int) * 8 - i * 4));
    }
    else
      x2 = 0;
    diff = x1 - x2;
    if (fabs (diff * scale) > diff_limit)
      diffcount++;
    if (abs (diff) > maxdiff) {
      maxdiff = abs (diff);
      maxsample1 = x1;
      maxsample2 = x2;
      maxcount = count;
    }
    if (ch == 0) {
      s0 = s0 + (diff * scale) * (diff * scale);
      count++;
    }
    else
      s1 = s1 + (diff * scale) * (diff * scale);
    ch = (ch + 1) % channels;
  }
  {
    double rms0 = sqrt (s0 / (double) count), rms1 = sqrt (s1 / (double) count);        /* 453 */

    if (r1 != NULL)
      printf ("WARNING: file %s is shorter!\n", argv[2]);
    if (r2 != NULL)
      printf ("WARNING: file %s is shorter!\n", argv[1]);
    printf ("rms channel 0\t%e\n", rms0);
    if (channels > 1)
      printf ("rms channel 1\t%e\n", rms1);
    printf ("limit\t\t%e\n", rms_limit);
    printf ("maximum difference %08X != %08X in sample %d,\n"
            "difference %d = %e, limit: %e\n",
            maxsample1, maxsample2, maxcount, maxdiff, maxdiff * scale,
            diff_limit);
    if (rms0 < rms_limit && (channels < 2 || rms1 < rms_limit)
        && diffcount == 0)
      printf ("encoder is compliant!\n");
    else {
      printf ("encoder is not compliant! %e/%e/%d\n", rms0, rms1, diffcount);
      return 1;
    }
  }
  return 0;
}
