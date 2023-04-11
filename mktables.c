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

#include <stdio.h>                                                   /* 129 */
#include <math.h>
#include "mp32pcm.h"
#define MP3_MIN_BUFFER (2*1152)                                      /*  15 */
#define MP3_CONTINUE 0                                               /*  26 */
#define MP3_SKIP   0x0100
#define MP3_REPEAT 0x0200
#define MP3_MUTE   0x0400
#define MP3_REPAIR 0x0800
#define MP3_BREAK 0x1000                                             /*  27 */
#define MP3_ERROR -1                                                 /*  28 */
#define MP3_ERROR_NO_INPUT -2                                        /*  40 */
#define MP3_ERROR_TOO_MANY -3                                        /*  45 */
#define MP3_ERROR_MEMORY -4                                          /*  47 */
#define MP3_ERROR_NO_ID -5                                           /*  54 */
#define MP3_ERROR_NOT_OPEN -6
#define MP3_ERROR_DONE -7                                            /*  57 */
#define MP3_ERROR_NO_BUFFER -8
#define MP3_ERROR_NO_SIZE -9
#define SCALEFACTOR_ERROR 0x0010                                     /* 114 */
#define MP3_EQ_UNITGAIN 210                                          /* 446 */
#define WINDOWBLOCKS 16                                              /*   1 */
#define SHIFTBLOCKS (2*BLOCKS + WINDOWBLOCKS-1)
#define SHIFTSIZE (SHIFTBLOCKS*SUBBANDS)
#define CHANNELS 2
extern void dct32 (const double *y, double *v);                      /*   5 */

extern void windowing (const double *v, mp3_sample * x);

#define STREAMS 512                                                  /*  41 */
#define END_OF_OUTPUT           0x0001                               /*  59 */
#define END_OF_INPUT  0x0002
#define LAYER_I   1                                                  /*  64 */
#define LAYER_II  2
#define LAYER_III 3
#define SUBBANDS 32                                                  /*  68 */
#define SUBFREQUENCIES 18
#define BLOCKS SUBFREQUENCIES
#define HEADER_SIZE 4                                                /*  77 */
#define BITALLOCATION_ERROR 0x0008                                   /* 109 */
#define OUTPUT_EXPONENT (sizeof(int)*8-1)                            /* 137 */
#define BUFFERSIZE (2*MAX_FRAME+HEADER_SIZE+MAX_RESERVOIR)           /* 148 */
#define MAX_FRAME 1729                                               /* 170 */
static int
tag_read (int id, void *buffer, int count)                           /*  38 */
 ;

#define GROUPS 3                                                     /* 202 */
     static unsigned short int                                       /* 211 */
       bitcrc (unsigned short int crc, unsigned short int bits, int n);

     extern void dct18 (const double *z, double *t);                 /* 219 */

#define LONG_BLOCK  0                                                /* 225 */
#define START_BLOCK 1
#define SHORT_BLOCK 2
#define STOP_BLOCK  3
     extern void dct6 (const double *z, double *t);                  /* 227 */

#define FREQUENCIES 576                                              /* 235 */
#define utothreequarter(ch,i) ((uv[ch][i]>=0)? power43[uv[ch][i]]:-power43[-uv[ch][i]]) /* 239 */
#define POWER43SIZE ((1<<13)+15)                                     /* 240 */
#define BANDS 39                                                     /* 242 */
#define GRANULES 2                                                   /* 247 */
#define twotomquarter(m)  power14[m+POWER14START]                    /* 250 */
#define SUBBLOCKS 3                                                  /* 264 */
#define POWER14START (326 - 4*OUTPUT_EXPONENT)                       /* 266 */
#define POWER14SIZE  (326 + 1 + 45)                                  /* 267 */
#define STEREO    0                                                  /* 280 */
#define INTENSITY 1
#define MID_SIDE  2
#define NONE 3                                                       /* 286 */
#define HWIDTH 6                                                     /* 298 */
#define HUFFMAN_CACHE_SIZE (sizeof(int)*8)                           /* 312 */
#define MAX_RESERVOIR 512                                            /* 321 */
#define BANDGROUPS 4                                                 /* 334 */
#define REGIONS 3                                                    /* 350 */
#define INTENSITY_V2 3                                               /* 387 */
#define LAYER_III_V2 4                                               /* 396 */
#define MUTE     5                                                   /* 400 */
#define REPEAT   6
#define REPAIR   7
#define SKIP     8
#ifndef max                                                          /* 437 */
#define max(a,b) ((a) >  (b) ? (a) : (b))
#endif
#ifndef min
#define min(a,b) ((a) >  (b) ? (b) : (a))
#endif
#ifndef M_PI
#define M_PI 3.14159265358979323846264338328
#endif
#define twotom32th(m)  power132[m]                                   /* 449 */
     void print_array (char *declaration, int size, void print_element (int i))
{                                                                    /* 131 */
  int i = 0;

  if (declaration)
    printf ("%s[%d]=", declaration, size);
  printf ("{\n");
  while (1) {
    print_element (i);
    if (++i >= size)
      break;
    printf (",");
    if (i % 3 == 0)
      printf ("\n");
    else
      printf (" ");
  }
  printf ("}");
  if (declaration)
    printf (";\n");
}

static int
scale (int s, int nbit)
{                                                                    /* 422 */
  s = s << (sizeof (int) * 8 - nbit);
  s = s + (3 << (sizeof (int) * 8 - 2));
  return -s;
}

static void
print_degroup_table (int n, int nlevels, int nbit)
{
  int s0, s1, s2, c, size;

  size = 1 << n;
  printf ("static const int degroup%d[%d][3] = {\n", n, size);
  for (c = 0; c < size; c++) { {
      int tmp;                                                       /* 200 */

      s0 = c % nlevels;
      tmp = c / nlevels;
      s1 = tmp % nlevels;
      tmp = tmp / nlevels;
      s2 = tmp % nlevels;
  }
  printf ("{%d, %d, %d}", scale (s0, nbit), scale (s1, nbit), scale (s2, nbit));
  if (c != size - 1)
    printf (",\n");
  }
  printf ("\n};\n\n");
}

const int bandwidth_table[3][3][22] = {                              /* 432 */
  {{4, 4, 4, 4, 4, 4, 6, 6, 8, 8, 10, 12, 16, 20, 24, 28, 34, 42, 50, 54, 76,
    158},
   {4, 4, 4, 4, 4, 4, 6, 6, 6, 8, 10, 12, 16, 18, 22, 28, 34, 40, 46, 54, 54,
    192},
   {4, 4, 4, 4, 4, 4, 6, 6, 8, 10, 12, 16, 20, 24, 30, 38, 46, 56, 68, 84, 102,
    26}},
  {{6, 6, 6, 6, 6, 6, 8, 10, 12, 14, 16, 20, 24, 28, 32, 38, 46, 52, 60, 68, 58,
    54},
   {6, 6, 6, 6, 6, 6, 8, 10, 12, 14, 16, 18, 22, 26, 32, 38, 46, 54, 62, 70, 76,
    36},
   {6, 6, 6, 6, 6, 6, 8, 10, 12, 14, 16, 20, 24, 28, 32, 38, 46, 52, 60, 68, 58,
    54}},
  {{6, 6, 6, 6, 6, 6, 8, 10, 12, 14, 16, 20, 24, 28, 32, 38, 46, 52, 60, 68, 58,
    54},
   {6, 6, 6, 6, 6, 6, 8, 10, 12, 14, 16, 20, 24, 28, 32, 38, 46, 52, 60, 68, 58,
    54},
   {12, 12, 12, 12, 12, 12, 16, 20, 24, 28, 32, 40, 48, 56, 64, 76, 90, 2, 2, 2,
    2, 2}
   }
};

const int bandwidth_table_short[3][3][13] = {
  {{4, 4, 4, 4, 6, 8, 10, 12, 14, 18, 22, 30, 56},
   {4, 4, 4, 4, 6, 6, 10, 12, 14, 16, 20, 26, 66},
   {4, 4, 4, 4, 6, 8, 12, 16, 20, 26, 34, 42, 12}},
  {{4, 4, 4, 6, 6, 8, 10, 14, 18, 26, 32, 42, 18},
   {4, 4, 4, 6, 8, 10, 12, 14, 18, 24, 32, 44, 12},
   {4, 4, 4, 6, 8, 10, 12, 14, 18, 24, 30, 40, 18}},
  {{4, 4, 4, 6, 8, 10, 12, 14, 18, 24, 30, 40, 18},
   {4, 4, 4, 6, 8, 10, 12, 14, 18, 24, 30, 40, 18},
   {8, 8, 8, 12, 16, 20, 24, 28, 36, 2, 2, 2, 26}}
};
static const int boundary_table[3] = { 8, 6, 6 };                    /* 427 */

#define FIRST_MIXED_SHORT 3
void
print_start_width (void)
{
  int width_table[3][3][2][2] = { 0 };
  int start_table[3][3][2][2] = { 0 };
  int version, f, mixed_block, short_block, k, width, band;

  int i = 0;

  printf ("static const short int sw[] = {\n");
  for (version = 0; version < 3; version++)
    for (f = 0; f < 3; f++) {
      short_block = 0;
      width_table[version][f][0][short_block] =
        width_table[version][f][1][short_block] = i;
      for (band = 0; band < 22; band++, i++)
        printf ("%d, ", bandwidth_table[version][f][band]);
      start_table[version][f][0][short_block] =
        start_table[version][f][1][short_block] = i;
      k = 0;
      printf ("\n%d, ", k);
      i++;
      for (band = 0; band < 22; band++, i++) {
        k = k + bandwidth_table[version][f][band];
        printf ("%d, ", k);
      }
      short_block = 1;
      mixed_block = 0;
      width_table[version][f][mixed_block][short_block] = i;
      for (band = 0; band < 13; band++, i = i + 3) {
        k = bandwidth_table_short[version][f][band];
        printf ("%d, %d, %d,\n", k, k, k);
      }
      start_table[version][f][mixed_block][short_block] = i;
      k = 0;
      printf ("%d, ", k);
      i++;
      for (band = 0; band < 13; band++, i = i + 3) {
        width = bandwidth_table_short[version][f][band];
        printf ("%d, %d, %d,\n", k + width, k + 2 * width, k + 3 * width);
        k = k + 3 * width;
      }
      short_block = mixed_block = 1;
      width_table[version][f][mixed_block][short_block] = i;
      for (band = 0; band < boundary_table[version]; band++, i++)
        printf ("%d, ", bandwidth_table[version][f][band]);
      for (band = FIRST_MIXED_SHORT; band < 13; band++, i = i + 3) {
        k = bandwidth_table_short[version][f][band];
        printf ("%d, %d, %d,\n", k, k, k);
      }
      start_table[version][f][mixed_block][short_block] = i;
      k = 0;
      printf ("%d, ", k);
      i++;
      for (band = 0; band < boundary_table[version]; band++, i++) {
        k = k + bandwidth_table[version][f][band];
        printf ("%d, ", k);
      }
      for (band = FIRST_MIXED_SHORT; band < 13; band++, i = i + 3) {
        width = bandwidth_table_short[version][f][band];
        printf ("%d, %d, %d,\n", k + width, k + 2 * width, k + 3 * width);
        k = k + 3 * width;
      }
    }
  printf (" 0};\n");
  printf ("static const short int *width_table[3][3][2][2]={");
  for (version = 0; version < 3; version++) {
    printf ("{");
    for (f = 0; f < 3; f++) {
      printf ("{{&sw[%d],&sw[%d]},{&sw[%d],&sw[%d]}}",
              width_table[version][f][0][0], width_table[version][f][0][1],
              width_table[version][f][1][0], width_table[version][f][1][1]);
      if (f < 2)
        printf (",\n");
    }
    if (version < 2)
      printf ("}\n,\n");
    else
      printf ("}\n};\n");
  }
  printf ("static const short int *start_table[3][3][2][2]={");
  for (version = 0; version < 3; version++) {
    printf ("{");
    for (f = 0; f < 3; f++) {
      printf ("{{&sw[%d],&sw[%d]},{&sw[%d],&sw[%d]}}",
              start_table[version][f][0][0], start_table[version][f][0][1],
              start_table[version][f][1][0], start_table[version][f][1][1]);
      if (f < 2)
        printf (",\n");
    }
    if (version < 2)
      printf ("}\n,\n");
    else
      printf ("}\n};\n");
  }
}

static unsigned short int
bitcrc (unsigned short int crc, unsigned short int bits, int n)
{                                                                    /* 438 */
  bits = bits << (16 - n);
  while (n-- > 0) {
    unsigned short int msb = (bits ^ crc) & 0x8000;

    crc = crc << 1;
    bits = bits << 1;
    if (msb)
      crc = crc ^ 0x8005;
  }
  return crc;
}

void
mfactors0 (int i)
{                                                                    /* 132 */
  printf ("%.16e", -1 *                                              /* 208 */
          ((double) ((unsigned) 1 << OUTPUT_EXPONENT))               /* 136 */
          *pow (2, 1 - i / 3.0)                                      /* 126 */
          /(9 * (((int) 1) << ((sizeof (int) * 8) - 1 - 4)))
    );
}

void
mfactors1 (int i)
{                                                                    /* 133 */
  printf ("%.16e", -1 *                                              /* 209 */
          ((double) ((unsigned) 1 << OUTPUT_EXPONENT))               /* 136 */
          *pow (2, 1 - i / 3.0)                                      /* 126 */
          /(5 * (((int) 1) << ((sizeof (int) * 8) - 1 - 3)))
    );
}

void
mfactors (int i, int n)
{                                                                    /* 134 */
  printf ("%.16e", -1 * ((double) ((unsigned) 1 << OUTPUT_EXPONENT)) /* 136 */
          *pow (2, 1 - i / 3.0)                                      /* 126 */
          /(((1 << n) - 1) * (((int) 1) << ((sizeof (int) * 8) - 1 - n)))
    );
}

static void
power43 (int u)
{                                                                    /* 237 */
  printf ("%.16e", pow (u, 4.0 / 3.0));
}

void
power14 (int i)
{                                                                    /* 248 */
  int m = i - POWER14START;

  double f = pow (2.0, 0.25 * m);

  printf ("%.16e", pow (2.0, 0.25 * m));
}

void
intensity_factor (int sp)
{                                                                    /* 275 */
  double phi = sp * M_PI / 12.0;                                     /* 274 */

  double p = cos (phi) / (sin (phi) + cos (phi));

  printf ("%.15f", p);
}

void
alias_coefficients (int i)
{                                                                    /* 294 */
  static const double c[8] =
    { -0.6, -0.535, -0.33, -0.185, -0.095, -0.041, -0.0142, -0.0037 };
  printf ("{%.16e, %.16e}", 1.0 / sqrt (1 + c[i] * c[i]),
          c[i] / sqrt (1 + c[i] * c[i]));
}

void
slength_v2 (int i)
{                                                                    /* 382 */
  if (i < 400)
    printf ("{%d, %d, %d, %d, 0, -1,0, 0}", (i >> 4) / 5, (i >> 4) % 5,
            (i % 16) >> 2, i % 4);
  else if (i < 500) {
    i = i - 400;
    printf ("{%d, %d, %d, 0, 0, -1, 0, 1}", (i >> 2) / 5, (i >> 2) % 5, i % 4);
  }
  else {
    i = i - 500;
    printf ("{%d, %d, 0, 0, 0, -1, 1, 2}", i / 3, i % 3);
  }
}

void
slength_v2i (int i)
{                                                                    /* 383 */
  if (i < 180)
    printf ("{%d, %d, %d, 0, 0, -1, 0, 0}", i / 36, (i % 36) / 6, (i % 36) % 6);
  else if (i < 244) {
    i = i - 180;
    printf ("{%d, %d, %d, 0, 0, -1, 0, 1}", (i % 64) >> 4, (i % 16) >> 2,
            i % 4);
  }
  else {
    i = i - 244;
    printf ("{%d, %d, 0, 0, 0, -1, 0, 2}", i / 3, i % 3);
  }
}

void
crc8 (int i)
{                                                                    /* 442 */
  printf ("0x%04x", bitcrc (0, (unsigned short int) i, 8));
}

void
power132 (int i)
{                                                                    /* 447 */
  printf ("%.16e", pow (2.0, (i - MP3_EQ_UNITGAIN) / 32.0));
}

int
main (void)
{ {
    int n, i;                                                        /* 135 */

    printf ("static const double mfactors[17][64] = {");
    print_array (NULL, 64, mfactors0);
    printf (",\n");
    print_array (NULL, 64, mfactors1);
    printf (",\n");
    for (n = 2; n <= 16; n++) {
      printf ("{\n");
      for (i = 0; i < 64; i++) {
        mfactors (i, n);
        if (i < 63)
          printf (",");
        if (i % 3 == 2)
          printf ("\n");
        else
          printf (" ");
      }
      printf ("}\n");
      if (n < 16)
        printf (",\n");
    }
    printf ("};\n");
}
print_array ("static const double power43", POWER43SIZE, power43);   /* 238 */
print_array ("static const double power14", POWER14SIZE, power14);   /* 249 */
print_array ("static const double intensity_factor", 7, intensity_factor);      /* 276 */
print_array ("static const struct {double c; double d;} alias_coefficients", 8, alias_coefficients);    /* 295 */
printf ("static const char slength_v2[512][8] =");                   /* 384 */
print_array (NULL, 512, slength_v2);
printf (";\n");
printf ("static const char slength_v2i[256][8] =");
print_array (NULL, 256, slength_v2i);
printf (";\n");
print_degroup_table (5, 3, 2);                                       /* 421 */
print_degroup_table (7, 5, 3);
print_degroup_table (10, 9, 4);
printf ("static const int (*degroup[6])[3]="                         /* 423 */
        "{degroup5,NULL,degroup7,NULL,NULL,degroup10};\n");
print_start_width ();                                                /* 434 */
print_array ("static unsigned short const crc_table", 256, crc8);    /* 443 */
print_array ("static const double power132", 256, power132);         /* 448 */
return 0;
}
