/* main.c
 * This File is part of wimp3 
 *
 *
 *	Copyright (c) 2004 Martin Ruckert (mailto:ruckertm@acm.org)
 * 
 * wimp3 is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * wimp3 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with m3w; if not, write to the
 * Free Software Foundation, Inc., 
 * 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#pragma warning(disable : 4996)

#include <windows.h>
#include <commctrl.h>


#include <stdio.h>
#include <math.h>

#include "mp32pcm.h"
#include "resource.h"
#include "winopt.h"
#include "error.h"



static HWND hMainDialog;
extern HINSTANCE hInst;
static HFONT hbigfont=NULL;
static HWAVEOUT hwaveout = NULL;
static BOOL device_open=FALSE;	// device open status
static BOOL playing=FALSE;

static WAVEFORMATEX wavefmtex={0};
static WAVEHDR wavehdr[2] ={0};
static short *wavemem[2]={NULL,NULL};
static int wavememsize;

static int bufindex;	
static int MoreBuffers=0;

static int MP3Stream = -1;
static int PCMStream = -1;
  
/* Display Information */
static HBITMAP hmono = 0, hjoint_stereo=0, hstereo=0;

extern void pcm_get_info(WAVEFORMATEX *fmt);

static void DisplayMode(int mode)
{ static int old=-1;
  HBITMAP bitmap;
  if (mode!=old)
  { if (mode == MP3_MONO)
	   bitmap=hmono;
    else if (mode==MP3_JOINT_STEREO)
	   bitmap=hjoint_stereo;
    else 
	   bitmap=hstereo;
    SendDlgItemMessage(hMainDialog,IDC_MODE,STM_SETIMAGE,IMAGE_BITMAP,(LPARAM)bitmap);
    old=mode;
  }
}

#define DisplayInt(id,i) \
{ static int old=-1; if ((i)!=old) { SetDlgItemInt(hMainDialog,id,i,FALSE); old=i;}}


static HBITMAP honled = 0, hoffled=0;
static void SetDlgItemBool(int item, BOOL b)
{ if (b)
	SendDlgItemMessage(hMainDialog,item,STM_SETIMAGE,IMAGE_BITMAP,(LPARAM)honled);
  else
	SendDlgItemMessage(hMainDialog,item,STM_SETIMAGE,IMAGE_BITMAP,(LPARAM)hoffled);
}

#define DisplayFlag(id,flag) \
{ static int old=-1; if ((flag)!=old) { SetDlgItemBool(id,flag); old=flag;}}


static void DisplayVersion(int version, int layer)
{ static int oldv =-1, oldl=-1;

static char *v[3][4]={
	{"1 I","2 I","2.5 I","",},
	{"1 II","2 II","2.5 II","",},
	{"1 III","2 III","2.5 III",""}};
  if (version!=oldv || layer != oldl)
  {	SetDlgItemText(hMainDialog,IDC_VERSION,v[layer-1][version]);
    oldv=version; oldl=layer;
  }
}

static void DisplayTime(double time) 
{ static char str[15];
  int h,m,s,cs; /* cs = centi second */ 
  cs = (int)floor(time*100);
  h = cs/360000;
  cs = cs - h*360000;
  m = cs/6000;
  cs = cs -m*6000;
  s = cs/100;
  cs = cs - s*100;
  sprintf(str,"%3d:%02d:%02d:%02d",h,m,s,cs);
  SetDlgItemText(hMainDialog,IDC_TIME,str);
  SetDlgItemText(hMainDialog,IDC_BIG,str);
}

static mp3_info stream_info;
static double stream_time = 0.0;

static void UpdateDisplay(void)
{ 
   if (hMainDialog==NULL) return;
   if (!IsWindowVisible(hMainDialog))return;     

   DisplayTime(stream_time);
   DisplayMode(stream_info.mode);
   DisplayInt(IDC_BITRATE,(stream_info.bit_rate+500)/1000);
   DisplayInt(IDC_FREQUENCY, stream_info.sample_rate);
   DisplayFlag(IDC_ORIGINAL,stream_info.original);
   DisplayFlag(IDC_COPYRIGHT,stream_info.copyright);
   DisplayFlag(IDC_EMPHASIS,stream_info.emphasis);
   DisplayFlag(IDC_CRC,stream_info.crc_protected);
   DisplayFlag(IDC_INTENSITY,stream_info.i_stereo);
   DisplayFlag(IDC_MIDSIDE,stream_info.ms_stereo);
   DisplayVersion(stream_info.version,stream_info.layer);
   DisplayInt(IDC_FRAME,stream_info.frame);
   DisplayInt(IDC_POSITION,stream_info.frame_position); 
}


/* Opening and closing a MP3 Stream */

static int info_callback(mp3_info *p)
{  static double delta = 0.0; // time for last frame
   static testcount=0;
   stream_info = *p;
   if (p->frame==1)
     stream_time = 0.0; 
   else
     stream_time = stream_time + delta;

   if (p->layer==1)
	 delta= 384.0/p->sample_rate;
   else
	 delta= 1152.0/p->sample_rate;
   testcount++;
   return MP3_CONTINUE;
}

extern int input_read(int id, void *buffer, size_t size);


static void close_mp3_stream(void)
{  if (MP3Stream>=0)
	  mp3_close(MP3Stream);
   MP3Stream = -1;
}
static void close_pcm_stream(void)
{  PCMStream = -1;
}


static int open_mp3_stream(void)
{ mp3_options options;

	close_mp3_stream(); /* just in case */
    options.flags = MP3_INFO_ONCE | MP3_INFO_FRAME | MP3_INFO_PCM;
	options.info_callback = info_callback;
	options.equalizer = NULL;
	options.tag_handler=NULL;
    MP3Stream = mp3_open(input_read,&options);
	if (MP3Stream < 0)
	{   win32_error(__LINE__,"Unable to open MP3 Decoder");
		return 0;
	}
	return 1;
}




/* Opening and Closing the PCM Output Device */


static void CloseDevice(void)
{ 	if (hwaveout!=NULL)
	{	if( waveOutUnprepareHeader( hwaveout, wavehdr+0, sizeof(WAVEHDR) ) ||
			waveOutUnprepareHeader( hwaveout, wavehdr+1, sizeof(WAVEHDR) ) )
				win32_error(__LINE__, "Error unpreparing play header.");
	    vmb_debug(VMB_DEBUG_PROGRESS, "Unprepared buffers");
		if( waveOutClose( hwaveout )!=MMSYSERR_NOERROR ) 
				win32_error(__LINE__, "Error closing wave play device.");
	    vmb_debug(VMB_DEBUG_PROGRESS, "Closed sound device");
		hwaveout=NULL;
	}
    if (wavemem[0]!=NULL) { free(wavemem[0]); wavemem[0]=NULL;}
    if (wavemem[1]!=NULL) { free(wavemem[1]); wavemem[1]=NULL;}
	device_open = FALSE;
}
extern DWORD dwSoundThreadId;

static void mp3_get_info(void)
{	mp3_read(MP3Stream,NULL,0);
	wavefmtex.wFormatTag = WAVE_FORMAT_PCM;
	wavefmtex.wBitsPerSample = stream_info.bit_per_sample;
	wavefmtex.nChannels = stream_info.channels;
	wavefmtex.nBlockAlign = stream_info.channels*(stream_info.bit_per_sample/8);
	wavefmtex.nSamplesPerSec = stream_info.sample_rate;
	wavefmtex.nAvgBytesPerSec = wavememsize = stream_info.sample_rate *stream_info.channels*(stream_info.bit_per_sample/8);
	wavefmtex.cbSize = 0;
}

static int OpenDevice(void)
{ MMRESULT mmr;
	if (device_open)
      return 0;
	// wavememsize was set to be enough for one second of data
	// we make it two tenth of a second
	wavememsize = wavememsize/5;
	//and round up to the next multiple of 2*1152 
	//to be able to contain a full stereo layer II/III frame
 
    wavememsize = ((wavememsize + 2*1152-1)/(2*1152))*(2*1152); 
    if (wavemem[0]!=NULL) { free(wavemem[0]); wavemem[0]=NULL;}
	wavemem[0] = malloc(wavememsize);
	if (wavemem[0]==NULL) 
	{ win32_error(__LINE__, "Error allocating wave memory.");
	  return 0;
	}
   if (wavemem[1]!=NULL) { free(wavemem[1]); wavemem[1]=NULL;}
	wavemem[1] = malloc(wavememsize);
	if (wavemem[1]==NULL) 
	{ win32_error(__LINE__, "Error allocating wave memory.");
	  return 0;
	}	
	if( mmr=waveOutOpen( &hwaveout, (UINT)WAVE_MAPPER, &wavefmtex, dwSoundThreadId, (DWORD)0, (DWORD)(CALLBACK_THREAD|WAVE_ALLOWSYNC) ) )
	{ 	    vmb_debugi(VMB_DEBUG_ERROR, "Error opening device %d",mmr);
		win32_error(__LINE__, "Error opening wave out device.");
	  return 0;
	}
	vmb_debugi(VMB_DEBUG_PROGRESS, "Opened sound device %dHz", wavefmtex.nSamplesPerSec);
	bufindex = 0;
	memset( wavehdr+0, 0, sizeof(WAVEHDR) );
	memset( wavehdr+1, 0, sizeof(WAVEHDR) );
	wavehdr[0].dwBufferLength = wavehdr[1].dwBufferLength = wavememsize;
	wavehdr[0].lpData = (LPSTR)wavemem[0];
	wavehdr[1].lpData = (LPSTR)wavemem[1];
	if( waveOutPrepareHeader( hwaveout, wavehdr+0, sizeof(WAVEHDR) ) ||
		 waveOutPrepareHeader( hwaveout, wavehdr+1, sizeof(WAVEHDR) ) )
	{
		CloseDevice();
		win32_error(__LINE__, "Error preparing header for playing.");
		return 0;
	}
	vmb_debug(VMB_DEBUG_PROGRESS, "Buffers prepared");

	device_open = TRUE;
	return 1;
}
	
void stop_sound(void)
{ MMRESULT r;
	// if the device isn't open, just return...
	if (hwaveout!=NULL)
	{ r = waveOutReset( hwaveout );
	  if (r==MMSYSERR_NOERROR)
	  vmb_debug(VMB_DEBUG_PROGRESS, "Reset Sound Device");
	else
	  vmb_debugi(VMB_DEBUG_ERROR, "Unable to reset Sound Device %d",r);
	}
	if(!playing) return;
	while (!wavehdr[0].dwFlags & WHDR_DONE) continue; 
    waveOutUnprepareHeader( hwaveout, wavehdr+0, sizeof(WAVEHDR) );
	while (!wavehdr[1].dwFlags & WHDR_DONE) continue; 
    waveOutUnprepareHeader( hwaveout, wavehdr+1, sizeof(WAVEHDR) );
		vmb_debug(VMB_DEBUG_PROGRESS, "Unprepared buffers");

	CloseDevice();
	close_mp3_stream();
	close_pcm_stream();
	playing=FALSE;
	MoreBuffers=0;
}

static int ReadSound( void )
{   int size;
	// if we haven't encountered the end of the wave yet,
	// read another buffer in...

		// read wave chunk from the file...
	if (MP3Stream >= 0)
	  size = mp3_read(MP3Stream, wavemem[bufindex],
		wavememsize/2); /* size in number of samples */
	else if (PCMStream>=0)
		size = input_read(PCMStream,wavemem[bufindex],wavememsize)/2; /* returns size in byte */
    else
	  size = 0;
	if (size >0 )
    	wavehdr[bufindex].dwBufferLength = size*2;
	else
	{	// otherwise the last buffer has been queued, just let it finish playing...
		MoreBuffers = 0;	// handled in MM_WOM_DONE in MainWndProc()
		return 0;
	}
	return 1;
}


static int play_sound()
{   // read and queue the next buffer
	UpdateDisplay();
	if(ReadSound())
	{	wavehdr[bufindex].dwFlags = (DWORD)WHDR_PREPARED;
	    if (hwaveout==NULL) 
		  return 0;
		if( waveOutWrite( hwaveout, wavehdr+bufindex, sizeof(WAVEHDR) ) )
		{  stop_sound();
		   win32_error(__LINE__, "Error writing wave buffer.");
		   return 0;
		}
		vmb_debugi(VMB_DEBUG_INFO, "Playing buffer %d",bufindex);
		// switch to next buffer...
		bufindex = 1 - bufindex;
		return 1;
	}
	return 0;
}


void start_mp3_sound(void)
{ 	if(playing)
	  return;
    if (!device_open)
	{ if (MP3Stream<0 && !open_mp3_stream())
		return;
	  mp3_get_info();
	  if (!OpenDevice())
		return;
	}
	playing=TRUE;
	MoreBuffers = 1;
	play_sound() && play_sound();
}


void start_pcm_sound(void)
{ 	if(playing)
	  return;
    if (!device_open)
	{ pcm_get_info(&wavefmtex);
	  wavememsize = wavefmtex.nSamplesPerSec*wavefmtex.nChannels*(wavefmtex.wBitsPerSample/8);
	  PCMStream=0;
	  if (!OpenDevice())
		return;
	}	
	playing=TRUE;
	MoreBuffers = 1;
	play_sound() && play_sound();
}

static INT_PTR CALLBACK  
MainDialogProc( HWND hDlg, UINT mId, WPARAM wparam, LPARAM lparam )
{ 
  switch ( mId )
  { case WM_INITDIALOG:
     hMainDialog = hDlg;
	 	   
	if (honled==0) honled= LoadBitmap(hInst,MAKEINTRESOURCE(IDB_ONLED));
	if (hoffled==0) hoffled= LoadBitmap(hInst,MAKEINTRESOURCE(IDB_OFFLED));
    if (hmono==0) hmono=LoadBitmap(hInst,MAKEINTRESOURCE(IDB_MONO));
    if (hjoint_stereo==0) hjoint_stereo=LoadBitmap(hInst,MAKEINTRESOURCE(IDB_JOINTSTEREO));
    if (hstereo==0) hstereo=LoadBitmap(hInst,MAKEINTRESOURCE(IDB_STEREO));

	 break;
	case WM_DRAWITEM: 
		{ LPDRAWITEMSTRUCT lpdis = (LPDRAWITEMSTRUCT) lparam; 
		  SIZE size;
		  char str[15];
		  int len;
 		  if (lpdis->itemAction==ODA_DRAWENTIRE)
		  { if (hbigfont==NULL)
		      hbigfont= CreateFont(lpdis->rcItem.bottom-lpdis->rcItem.top,
			    0,0,0,0,FALSE,FALSE,FALSE,ANSI_CHARSET,
				OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,
				DEFAULT_PITCH|FF_MODERN,
				"Arial");
			SelectObject(lpdis->hDC,hbigfont);
			len = GetWindowText(lpdis->hwndItem,str,15);
			GetTextExtentPoint32(lpdis->hDC,str,len,&size);
			TextOut(lpdis->hDC,lpdis->rcItem.right-size.cx,0,str,len);
		  }
		}
		break;
#if 1
   case WM_CTLCOLORSTATIC:
	 { HDC hDC = (HDC) wparam;   // handle to display context 
 
 	   SetBkColor(hDC,0);
	   SetTextColor(hDC,0x000000FF);
	 }
   case WM_CTLCOLORDLG:
	 return (INT_PTR)GetStockObject(BLACK_BRUSH);
#endif

 
   case WM_DESTROY:
	  if (hbigfont!=NULL) DeleteObject(hbigfont);
	  hMainDialog=NULL;
      return TRUE;
 

  }
  return FALSE;
}

HWND createPlayerWindow(HWND hParent)
{ HWND hPlayer;
  hPlayer= CreateDialog(hInst,MAKEINTRESOURCE(IDD_MAIN) ,hParent,MainDialogProc);
  SetWindowText(hPlayer,"MP3 Player");
  return hPlayer;
}


void mp3_buffer_done(void)
{		if( MoreBuffers )
			play_sound();
		else
			stop_sound();
}



/* the playing of an audio stream has several levels of init and delete

program init
   player init
      stream init
	     sound init
		    update information
			...
		    update information
		 sound delete
		 ...
		 sound init
		 sound delete
	  stream delete
	  ...
      stream init
	     sound init
		 sound delete
		 ...
		 sound init
		 sound delete
	  stream delete
   player delete
program delete

now one at a time
program init: nothing unusual
  RegisterClass, CreateWindow, ShowWindow, UpdateWindow, processing loop
program delete:
  return

player init: inside the WM_CREATE method of MainWndProc
    creating the elements of the main window, allocating data, checking the sound card
player delete: inside the WM_DESTROY method of MainWndProc
    posting the quit message, deallocating data

stream init: geting the input stream ready, the name, the file, the decoder
stream delete: closing the input stream 

sound init:
   initializing the soundcard proper
   starting to deliver buffers to the soundcard
sound delete:
   stoping the delivery of buffers

update information:
   information from the decoder sould be reflected on the display.


*/
