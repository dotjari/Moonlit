#ifndef GRAPHICS_H
#define GRAPHICS_H
#include "window.h"
#include <windows.h>
#include <windowsx.h>
#include <stdlib.h>

struct sRectangle
{

    HDC rectDC;
    //Draw a rectangle - width, height, x, y, color (use the RGB(r,g,b) function)
    void Draw(int w, int h, int x, int y, int c)
    {
        HBRUSH hBrush = CreateSolidBrush(c); //Create the color for the Rectangle
        Rectangle(memoryDC,x,y,w,h); //Create the Rectangle
    }

    void Destroy()
    {
        //For future use
    }
};

//Draw a pixel (isn't a literal pixel because the size is variable)
//x, y, color (use the RGB(r,g,b), size function)
void drawPixel(int x, int y, int c, int size = 1)
{
    HBRUSH hBrush = CreateSolidBrush(c); //Create a Brush to paint the "pixel"
    RECT r; //positions
    r.left = x;//x
    r.top = y;//y
    r.right = x + size;//width
    r.bottom = y + size;//height
    FillRect(memoryDC,&r,hBrush);//Paint the pixel
    DeleteObject(hBrush);//Delete the Brush after using it
}
#endif
