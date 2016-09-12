# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 27 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *buffer1;
extern unsigned short *buffer2;



void setPixel3(int row, int col,volatile unsigned short color);
void drawRect3(int row, int col, int height, int width,volatile unsigned short color);
void fillScreen3(volatile unsigned short color);


void setPixel4(int row, int col,volatile unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width,volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char color);
void drawBackgroundImage4(volatile const unsigned short* image);
void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width);
void loadPalette(volatile const unsigned short* palette);
void drawSubImage4(volatile const unsigned short* sourceImage, int sourceRow, int sourceCol, int sourceWidth,
       int row, int col, int height, int width);

void drawChar(int row, int col, char ch, unsigned short color);
void drawString(int row, int col, char *str, unsigned short color);

void waitForVblank();
void flipPage();
# 73 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 83 "myLib.h"
void DMANow(int channel, volatile void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 122 "myLib.h"
typedef struct
{
 int row;
 int col;
 int rdel;
 int cdel;
 int size;
 int imageIndex;
} MOVOBJ;
# 2 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer = (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void setPixel4(int row, int col, unsigned char colorIndex)
{
 unsigned short pixels = videoBuffer[((row)*(240/2)+(col/2))];

 if(col & 1)
 {
  pixels &= (0xFF);
  videoBuffer[((row)*(240/2)+(col/2))] = (pixels) | (colorIndex << 8);
 }
 else
 {
  pixels &= (0xFF << 8);
  videoBuffer[((row)*(240/2)+(col/2))] = (pixels) | (colorIndex);
 }
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{
 unsigned short pixels = colorIndex << 8 | colorIndex;

 int r;
 for(r = 0; r < height; r++)
 {
  if(col & 1)
  {
   setPixel4(row+r, col, colorIndex);

   if(width & 1)
   {
    DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+((col+1)/2))], (width/2) | (2 << 23));
   }
   else
   {
    DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+((col+1)/2))], ((width/2)-1) | (2 << 23));
    setPixel4(row+r, col+width - 1, colorIndex);
   }
  }
  else
  {
   DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+(col/2))], (width/2) | (2 << 23));
   if(width & 1)
   {
    setPixel4(row+r, col+width - 1, colorIndex);
   }
  }
 }
}

void fillScreen4(unsigned char colorIndex)
{
 volatile unsigned short pixels = (colorIndex << 8) | (colorIndex);
 DMANow(3, &pixels, videoBuffer, ((240 * 160)/2) | (2 << 23));
}

void drawBackgroundImage4(volatile const unsigned short* image)
{
 DMANow(3, image, videoBuffer, 19200 | (0 << 23));
}

void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width)
{
 if(col%2)
  col++;

 int r;
 for(r = 0; r < height; r++) {
  DMANow(3,
               (unsigned short*)&image[((r)*(width/2)+(0))],
               &videoBuffer[((row + r)*(240/2)+(col/2))],
               width/2);
 }
}

void loadPalette(volatile const unsigned short* palette)
{
 DMANow(3, palette, ((u16 *)0x5000000), 256|(0 << 21)|(0 << 23));
}

void DMANow(int channel, volatile void* source, volatile void* destination, unsigned int control)
{
 dma[channel].src = source;
 dma[channel].dst = destination;
 dma[channel].cnt = (1 << 31) | control;
}

void waitForVblank()
{
 while(*(volatile u16 *)0x4000006 > 160);
 while(*(volatile u16 *)0x4000006 < 160);
}

void flipPage()
{
    if(*(unsigned short *)0x4000000 & (1<<4))
    {
        *(unsigned short *)0x4000000 &= ~(1<<4);
        videoBuffer = backBuffer;
    }
    else
    {
        *(unsigned short *)0x4000000 |= (1<<4);
        videoBuffer = frontBuffer;
    }
}
