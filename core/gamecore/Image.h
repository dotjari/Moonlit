#include "../window.h"
#include <windows.h>
#include <windowsx.h>
#include <stdlib.h>
typedef struct Image
{

	HBITMAP bmpSource;
	HDC hdcSource;
	BITMAP bitmap;
	void Load(LPCSTR filename)
	{
		bmpSource = (HBITMAP)LoadImage(NULL, filename , IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
        hdcSource = CreateCompatibleDC(GetDC(0));
        SelectObject(hdcSource, bmpSource);
	}
	void Draw(int x, int y, int nWidth, int nHeight)
	{
    	//GetObject(bmpSource, sizeof(bitmap), &bitmap);

 		BitBlt(memoryDC, x, y, nWidth, nHeight, hdcSource, 0, 0, SRCCOPY);
		
//MaskBlt(memoryDC,x,y,nWidth,nHeight,hdcSource,0,0,(HBITMAP)LoadImage(NULL, "logomask.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE),0,0,SRCCOPY);
	//DeleteDC(hdcSource);
	}

	void Destroy()
	{
			DeleteDC(hdcSource);
	}
	
};
