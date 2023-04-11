/*
    Copyright 2005 Martin Ruckert
    
    ruckertm@acm.org

    (Minor fixes (c) 2023 by Ziemowit Laski <zlaski@ziemas.net>)

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

#include <stdlib.h>                                                  /*  10 */

#ifdef __cplusplus
extern "C" {
#endif

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
typedef short int mp3_sample;                                        /*  14 */

typedef struct mp3_info
{                                                                    /*  23 */
  int id;
  unsigned int header;
  int version;                                                       /*  31 */
#define MP3_V1_0 0x00
#define MP3_V2_0 0x01
#define MP3_V2_5 0x02
  int layer;
  int crc_protected;                                                 /*  32 */
  int bit_rate;
  int frame_size;
  int frame_position;
  int samples;
  int private_bit;
  int mode;
#define MP3_STEREO       0x00
#define MP3_JOINT_STEREO 0x01
#define MP3_DUAL_CHANNEL 0x02
#define MP3_MONO         0x03
  int copyright;
  int original;
  int emphasis;
  int frame;
  int sample_rate;                                                   /*  33 */
  int channels;
  int bit_per_sample;
  int free_format;                                                   /*  84 */
  int frequency_index;                                               /*  86 */
  int padding;                                                       /*  89 */
  int bound;                                                         /*  96 */
  int changes;                                                       /* 182 */
  int ms_stereo;                                                     /* 282 */
  int i_stereo;
  int fixed_size;                                                    /* 431 */
} mp3_info;

typedef struct mp3_options
{                                                                    /*  19 */
  int flags;                                                         /*  20 */
#define MP3_TWO_CHANNEL_MONO 0x0100                                  /*  21 */
  int (*info_callback) (mp3_info * p);                               /*  22 */
#define MP3_INFO_NEVER    0x00                                       /*  29 */
#define MP3_INFO_IGNORE   0x01
#define MP3_INFO_ONCE     0x02
#define MP3_INFO_FRAME    0x04
#define MP3_INFO_READ     0x08
#define MP3_INFO_PCM      0x10
#define MP3_INFO_MPG      0x20
#define MP3_INFO_CRC      0x40
#define MP3_INFO_RESERVED 0x80
#define MP3_SYNC_1         0x0400                                    /*  35 */
#define MP3_SYNC_2         0x0000
#define MP3_SYNC_3         0x0800
  void (*tag_handler) (int id, int tag_read (int id, void *buffer, int count)   /*  38 */
    );
#define MP3_DONT_FLUSH 0x0200                                        /*  73 */
#define MP3_NO_PARTIAL_FRAME 0x1000                                  /* 330 */
  unsigned char (*equalizer)[32];                                    /* 444 */
} mp3_options;

extern int mp3_open (                                                /*  11 */
                      int (*input_read) (int id, void *buffer, size_t size)     /*  12 */
                      , mp3_options * option_pointer                 /*  18 */
  );

extern int
mp3_read (int id, mp3_sample * buffer, int size)                     /*  13 */
 ;

     extern int mp3_close (int id)                                   /*  16 */
 ;

#ifdef __cplusplus
}
#endif
