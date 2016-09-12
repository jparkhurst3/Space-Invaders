# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"






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



void waitForVblank();
void flipPage();
# 72 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 82 "myLib.h"
void DMANow(int channel, volatile void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 121 "myLib.h"
typedef struct
{
 int row;
 int col;
 int rdel;
 int cdel;
 int size;
 int imageIndex;
} MOVOBJ;
# 8 "text.c" 2
# 1 "text.h" 1
# 9 "text.h"
void drawChar(int , int , char , unsigned short );
void drawString(int row, int col, char *str, unsigned short color);

extern const unsigned char fontdata_6x8[12288];
# 9 "text.c" 2

void drawChar(int row, int col, char ch, unsigned short color)
{
    int r, c;
    for(r=0; r<8; r++)
    {
        for(c=0; c<6; c++)
        {
            if(fontdata_6x8[ch*6*8+r*6+c])
            {
                setPixel4(row+r, col+c, color);
            }
        }
    }
}

void drawString(int row, int col, char *str, unsigned short color)
{
    while(*str != '\0')
    {
        drawChar(row, col, *str, color);
        str++;
        col += 6;
    }
}


const unsigned char fontdata_6x8[12288] = {

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
# 91 "text.c"
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,0,0,1,1,
1,1,0,0,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,0,0,0,0,1,
1,0,1,1,0,1,
1,0,1,1,0,1,
1,0,0,0,0,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,1,1,1,
0,0,0,0,1,1,
0,0,1,1,0,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,0,0,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,1,1,0,1,1,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,0,0,
0,0,1,0,1,0,
0,0,0,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,1,1,1,1,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,1,1,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,1,1,
0,1,1,0,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,1,
0,1,1,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,1,1,
0,1,0,0,1,1,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,1,1,
0,1,0,1,0,1,
0,1,1,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,1,1,1,
0,1,0,1,0,1,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,1,1,1,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,0,0,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,1,0,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,1,0,1,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,1,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,0,1,0,
0,1,0,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,1,0,1,0,
0,1,0,1,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,0,1,1,
0,1,0,1,0,1,
0,0,0,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,

1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,
1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,0,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,0,0,0,
1,0,0,1,1,0,
1,0,0,0,0,1,
1,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,1,1,
0,1,1,0,0,1,
1,0,0,0,0,1,
0,0,0,0,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
1,1,0,0,1,0,
1,1,0,0,1,1,
1,1,1,1,1,0,
0,0,1,1,1,1,

0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
};
