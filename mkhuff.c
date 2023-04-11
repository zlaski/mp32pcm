#include <stdlib.h>
#include <stdio.h>

/* from dist 10 huffman.h */
#define HUFFBITS unsigned long int
#define HTN	34
#define MXOFF	250

struct huffcodetab {
  char tablename[3];	/*string, containing table_description	*/
  unsigned int xlen; 	/*max. x-index+			      	*/ 
  unsigned int ylen;	/*max. y-index+				*/
  unsigned int linbits; /*number of linbits			*/
  unsigned int linmax;	/*max number to be stored in linbits	*/
  int ref;		/*a positive value indicates a reference*/
  HUFFBITS *table;	/*pointer to array[xlen][ylen]		*/
  unsigned char *hlen;	/*pointer to array[xlen][ylen]		*/
  unsigned char *xy;    /*pointer to array[xlen][ylen]		*/
  int size;
};

/* from dist 10 huffman.c */
     
HUFFBITS dmask = ((HUFFBITS)1<<(sizeof(HUFFBITS)*8-1));
unsigned int hs = sizeof(HUFFBITS)*8;

struct huffcodetab ht[HTN];	/* array of all huffcodtable headers	*/
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* read the huffman encode table */
int read_huffcodetab(fi) 
FILE *fi;
{

  char line[100],command[40],huffdata[40];
  unsigned int t,i,j,k,nn,x,y,n=0;
  unsigned int xl, yl, len;
  HUFFBITS h;
  int	hsize;
  
  hsize = sizeof(HUFFBITS)*8; 
  do {
      fgets(line,99,fi);
  } while ((line[0] == '#') || (line[0] < ' ') );
  
  do {    
    while ((line[0]=='#') || (line[0] < ' ')) {
      fgets(line,99,fi);
    } 

    sscanf(line,"%s %s %u %u %u",command,ht[n].tablename,
			         &xl,&yl,&ht[n].linbits);
    if (strcmp(command,".end")==0)
      return n;
    else if (strcmp(command,".table")!=0) {
      fprintf(stderr,"huffman table %u data corrupted\n",n);
      return -1;
    }
    ht[n].linmax = (1<<ht[n].linbits)-1;
   
    sscanf(ht[n].tablename,"%u",&nn);
    if (nn != n) {
      fprintf(stderr,"wrong table number %u\n",n);
      return(-2);
    } 

    ht[n].xlen = xl;
    ht[n].ylen = yl;
    ht[n].size = xl*yl;
    do {
      fgets(line,99,fi);
    } while ((line[0] == '#') || (line[0] < ' '));

    sscanf(line,"%s %u",command,&t);
    if (strcmp(command,".reference")==0) {
      ht[n].ref   = t;
      ht[n].table = ht[t].table;
      ht[n].hlen  = ht[t].hlen;
      if ( (xl != ht[t].xlen) ||
           (yl != ht[t].ylen)  ) {
        fprintf(stderr,"wrong table %u reference\n",n);
        return (-3);
      };
      do {
        fgets(line,99,fi);
      } while ((line[0] == '#') || (line[0] < ' ') );
    } 
    else {
#ifdef DEBUG
      fprintf(stderr,"doing table %u \n",n);
#endif     
      ht[n].ref  = -1;
      ht[n].table=(HUFFBITS *) calloc(xl*yl,sizeof(HUFFBITS));
      if (ht[n].table == NULL) {
         fprintf(stderr,"unsufficient heap error\n");
         return (-4);
      }
      ht[n].hlen=(unsigned char *) calloc(xl*yl,sizeof(unsigned char));
      if (ht[n].hlen == NULL) {
         fprintf(stderr,"unsufficient heap error\n");
         return (-4);
      }
      ht[n].xy=(unsigned char *) calloc(xl*yl,sizeof(unsigned char));
      if (ht[n].xy == NULL) {
         fprintf(stderr,"unsufficient heap error\n");
         return (-4);
      }
      for (i=0; i<xl; i++) {
        for (j=0;j<yl; j++) {
	  if (xl>1) 
            sscanf(line,"%u %u %u %s",&x, &y, &len,huffdata);
	  else 
            { sscanf(line,"%u %u %s",&x,&len,huffdata); y = 0; }
          if (n<32 && (i!=x || j!=y))
            fprintf(stderr, "huffman-table %u index error (%d!=%d || %d!=%d)\n",n,i,x,j,y);
          h=0;k=0;
	  while (huffdata[k]) {
            h <<= 1;
            if (huffdata[k] == '1')
              h++;
            else if (huffdata[k] != '0'){
              fprintf(stderr,"huffman-table %u bit error\n",n);
              return (-5);
            };
            k++;
          };
          if (k != len) {
           fprintf(stderr,
              "warning: wrong codelen in table %u, pos [%2u][%2u]\n",
	       n,i,j);
          };
          ht[n].table[i*xl+j] = h;
          ht[n].hlen[i*xl+j] = (unsigned char) len;
          ht[n].xy[i*xl+j] = (unsigned char) (((x<<4)&0xF0) | (y&0x0F));
	  do {
            fgets(line,99,fi);
          } while ((line[0] == '#') || (line[0] < ' '));
        }
      }
    }
    n++;
  } while (1);
}

/* this is my own stuff */
#define EXTENSIONS 1000
unsigned int base[EXTENSIONS];
int bsize[EXTENSIONS];
int esize[EXTENSIONS];
int offset[EXTENSIONS];
int ecount=0;

static int prefix(HUFFBITS b,int bsize, HUFFBITS c,int csize)
/* returns true, if b is a prefix of c up to size */
{ 
  HUFFBITS mask;
  if (csize > bsize)
    { c= c>> (csize-bsize); 
      csize=bsize;
    }
  else if (csize < bsize)
    { b = b >> (bsize-csize);
      bsize = csize;
    }
  mask=((1<<bsize)-1);
  return (c & mask) == (b & mask);

}

#define HWIDTH 6
#define VARSIZE 1



static void printaction(struct huffcodetab t, int b, 
                        int basesize, int ext, int extsize, FILE *fo, int baseoffset)
/* the format here is 8bit bits_used,
   4bit decoded value x and 4 bit decoded value y
or
   a negative value indicating an extension
   with 12 bit negative offset from the start of the table 
   to the extension table plus 4 bit for the
   width of the extension table.
  */
 
{ 
  int i,isize,k, maxsize;
  unsigned short v;
  char komma;

  if (ext< (1<<extsize)-1)
    komma = ',';
  else
    komma = ' '; 
  i = (b<<extsize)| ext;
  isize=basesize+extsize;
  for (k=0; k< t.size; k++)
  { if (prefix(t.table[k],t.hlen[k],i,isize))
    { if (t.hlen[k]<=isize)
      {  v = ((t.hlen[k]-basesize)<<8) | t.xy[k];
         fprintf(fo,"\t0x%04X%c",v,komma);
         fprintf(fo,"\t /*%d: 0x%02X -> '0x%X 0x%X' %d bit used*/\n",
                  ext,i, t.xy[k]>>4,t.xy[k]&0x0F,t.hlen[k]-basesize);
        return;
      }
    }
  }
  /* no entry, its an extension */ 
  if (ecount >= EXTENSIONS) 
  {  fprintf(stderr,"Insufficient extensions\n");
     exit(1);
  }
  maxsize=0;
  for (k=0; k< t.size; k++)
  { if (prefix(t.table[k],t.hlen[k],i,isize) && t.hlen[k]>maxsize)
       maxsize=t.hlen[k];
  }
  if (maxsize>isize+HWIDTH)
    maxsize=isize+HWIDTH;
  if (!VARSIZE && maxsize<isize+HWIDTH)
    maxsize=isize+HWIDTH;
  bsize[ecount]=isize;
  base[ecount]=i;
  esize[ecount]=maxsize;
  if (offset[ecount]>= (1<<12))
    { fprintf(stderr,"Offset overflow %d >= %d\n",offset[ecount], (1<<12));
      exit(1);
    }
  v =  ((-(offset[ecount]-baseoffset))<<4)| (maxsize-isize);
  fprintf(fo,"\t%d%c",(signed short)v,komma);
  fprintf(fo,"\t /*%d: 0x%04X 0x%02X -> extension %d with %d bit, offset %d*/\n",
         ext,v,i, ecount, maxsize-isize, offset[ecount]-baseoffset);
  ecount++;
  offset[ecount]=offset[ecount-1]+(1<<(maxsize-isize));
}

static void printsmallaction(struct huffcodetab t, int ext, int extsize, FILE *fo)
/* the format here is 4bit decoded value 
   and 4 bit used (not putback) */
{ 
  int i,isize,k, maxsize;
  unsigned short v;
  char komma;

  if (ext< (1<<extsize)-1)
    komma = ',';
  else
    komma = ' '; 
  i =  ext;
  isize=extsize;
  for (k=0; k< t.size; k++)
  { if (prefix(t.table[k],t.hlen[k],i,isize))
    { if (t.hlen[k]<=isize)
      {  v = (t.hlen[k]&0x0F) | (t.xy[k]&0xF0);
         fprintf(fo,"\t0x%02X%c",v,komma);
         fprintf(fo,"\t /*0x%02X -> 0x%X, %d bit used*/\n",
                  i, t.xy[k]>>4,t.hlen[k] );
        return;
      }
    }
  }
}



int display_table(struct huffcodetab t, FILE * fo)
{  int i,k, bs; 
   int subtotal;
   subtotal = 0;
   if (t.ref >= 0)
    return 0;
   if (t.size == 0)
     return 0;
   
   fprintf(fo,"static short int htab%s[]={\n",t.tablename);
   bs = HWIDTH;
   ecount = 0;
   offset[ecount] = 1<<bs;
   for(i=0;i<(1<<bs);i++)
     printaction(t,0,0,i,bs,fo,0);
   subtotal = (1<<bs);
   k=0;
   while (k<ecount)
   { fprintf(fo,",\n");
     fprintf(fo,"\n/* Extension: %d*/\n",k);
     bs = (esize[k]-bsize[k]);
     for(i=0;i<(1<<bs);i++)
       printaction(t,base[k],bsize[k],i,bs,fo,offset[k]);
     subtotal += (1<<bs);
     k++;
   }
   fprintf(fo,"};\n");

   return subtotal;
}

int display_small_table(struct huffcodetab t, FILE * fo)
{  int i,k, bs; 
   int subtotal=0;
   subtotal = 0;
   if (t.ref >= 0)
    return 0;
   if (t.size == 0)
     return 0;
   
   fprintf(fo,"static unsigned char htabA[]={\n");
   bs = 6;
   ecount = 0;
   offset[ecount] = 1<<bs;
   for(i=0;i<(1<<bs);i++)
     printsmallaction(t,i,bs,fo);
   fprintf(fo,"};\n");
   return subtotal;
}


int write_huffcodetab(FILE *fo)
{ int i;
 int total = 0;
  for (i=0;i<32;i++)
    total += display_table(ht[i],fo);
  fprintf(fo,
"static struct\n"
"{ short int *h;\n"
"  short int linbits;\n"
"} huffman_tables[] = \n"
"{ {NULL,0}, /* all zero*/ \n"
"  {htab1,0},\n"
"  {htab2,0},\n"
"  {htab3,0},\n"
"  {htab3,0}, /* not used */\n"
"  {htab5,0},\n"
"  {htab6,0},\n"
"  {htab7,0},\n"
"  {htab8,0},\n"
"  {htab9,0},\n"
"  {htab10,0},\n"
"  {htab11,0},\n"
"  {htab12,0},\n"
"  {htab13,0},\n"
"  {htab13,0}, /* not used */\n"
"  {htab15,0},\n"
"  {htab16,1},\n"
"  {htab16,2},\n"
"  {htab16,3},\n"
"  {htab16,4},\n"
"  {htab16,6},\n"
"  {htab16,8},\n"
"  {htab16,10},\n"
"  {htab16,13},\n"
"  {htab24,4},\n"
"  {htab24,5},\n"
"  {htab24,6},\n"
"  {htab24,7},\n"
"  {htab24,8},\n"
"  {htab24,9},\n"
"  {htab24,11},\n"
"  {htab24,13}\n"
"};\n"
);

  fprintf(stderr,"\nBasesize %d,%s, Total table entries %d\n", HWIDTH,VARSIZE?"Variable tablesize":"Fixed tablesize",total);
  display_small_table(ht[32],fo);
  return 0;
}


struct smallvalues {
  unsigned int n:8;
  signed int v:2;
  signed int w:2;
  signed int x:2;
  signed int y:2;
};

struct smallvalues x[] = {{0,0,0,0,0},{3,1,-1,1,1}};

struct smallvalues values(int i)
{ struct smallvalues s;
  int k;
  k = 0;
  if ((i & 0x80)== 0)s.v=0;
  else {
    if ((i>> (3-k)) & 1) s.v=-1; else s.v=+1;
    k++; 
  }
  if ((i & 0x40)== 0)s.w=0;
  else {
    if ((i>> (3-k)) & 1) s.w=-1; else s.w=+1;
    k++; 
  }
  if ((i & 0x20)== 0)s.x=0;
  else {
    if ((i>> (3-k)) & 1) s.x=-1; else s.x=+1;
    k++; 
  }
  if ((i & 0x10)== 0)s.y=0;
  else {
    if ((i>> (3-k)) & 1) s.y=-1; else s.y=+1;
    k++; 
  }
  s.n=k;
  return s;
}


int write_signbits(FILE *fo)
{ int i;
 struct smallvalues s;  
 fprintf(fo,"static struct {\n"
        "unsigned int n:8;\n"
        "signed int u0:2;\n"
        "signed int u1:2;\n"
        "signed int u2:2;\n"
        "signed int u3:2;\n"
        "} signed_small_values[256] = {\n");
  for (i=0;i<0x100;i++){
    s = values(i);
    fprintf(fo,"/*0x%02X*/ {%d, %d, %d, %d, %d}",i,s.n,s.v,s.w,s.x,s.y);
    if (i!=0xFF) fprintf(fo,",\n");
  }
  fprintf(fo,"};\n");
  return 0;
}

int main()
{ FILE *fi,*fo;
 int err;
 fi = fopen("huffcode","r");
 if (fi==NULL)
 {  fprintf(stderr,"Unable to open input file huffcode\n");
     return 1;
 }
 fo = fopen("huffman.h","w");
 if (fo==NULL)
 {  fprintf(stderr,"Unable to open output file huffman.h\n");
     return 1;
 }
 err = read_huffcodetab(fi);
 if (err!=HTN)
  {  fprintf(stderr,"Unable to read input file huffcode error=%d\n",err);
     return 1;
 } 
 err = write_huffcodetab(fo);
 err |= write_signbits(fo);
 if (err!=0)
  {  fprintf(stderr,"Unable to write output file huffman.h error=%d\n",err);
     return 1;
 } 
 return 0;
}
