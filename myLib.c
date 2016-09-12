#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void setPixel4(int row, int col, unsigned char colorIndex)
{
	unsigned short pixels = videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)];

	if(col & 1) // odd
	{
		pixels &= (0xFF);
		videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)] = (pixels) | (colorIndex << 8);
	}
	else // even
	{
		pixels &= (0xFF << 8);
		videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)] = (pixels) | (colorIndex);
	}
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{
	unsigned short pixels = colorIndex << 8 | colorIndex;

	int r;
	for(r = 0; r < height; r++)
	{
		if(col & 1) // odd starting col
		{
			setPixel4(row+r, col, colorIndex);

			if(width & 1) // if width is odd
			{
				DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, (col+1)/2, SCREENWIDTH/2)], (width/2) | DMA_SOURCE_FIXED);
			}
			else  // width is even
			{
				DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, (col+1)/2, SCREENWIDTH/2)], ((width/2)-1) | DMA_SOURCE_FIXED);
				setPixel4(row+r, col+width - 1, colorIndex);
			}
		}
		else // even starting col
		{
			DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, col/2, SCREENWIDTH/2)], (width/2) | DMA_SOURCE_FIXED);	
			if(width & 1) // if width is odd
			{
				setPixel4(row+r, col+width - 1, colorIndex);
			}
		}
	}	
}

void fillScreen4(unsigned char colorIndex)
{
	volatile unsigned short pixels = (colorIndex << 8) | (colorIndex);
	DMANow(3, &pixels, videoBuffer, ((240 * 160)/2) | DMA_SOURCE_FIXED);
}

void drawBackgroundImage4(volatile const unsigned short* image)
{
	DMANow(3, image, videoBuffer, 19200 | DMA_SOURCE_INCREMENT);
}

void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width)
{
	if(col%2) 
		col++;

	int r;
	for(r = 0; r < height; r++)	{
		DMANow(3,
               (unsigned short*)&image[OFFSET(r,0,width/2)],
               &videoBuffer[OFFSET(row + r, col/2, SCREENWIDTH/2)],
               width/2);
	}
}

void loadPalette(volatile const unsigned short* palette)
{
	DMANow(3, palette, PALETTE, 256|DMA_DESTINATION_INCREMENT|DMA_SOURCE_INCREMENT);
}

void DMANow(int channel, volatile void* source, volatile void* destination, unsigned int control)
{
	dma[channel].src = source;
	dma[channel].dst = destination;
	dma[channel].cnt = DMA_ON | control;
}

void waitForVblank()
{
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

void flipPage()
{
    if(REG_DISPCTL & BUFFER2)
    {
        REG_DISPCTL &= ~BUFFER2;
        videoBuffer = backBuffer;
    }
    else
    {
        REG_DISPCTL |= BUFFER2;
        videoBuffer = frontBuffer;
    }
}
