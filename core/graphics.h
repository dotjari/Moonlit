#ifndef DIALOG_H
#define DIALOG_H
#include "window.h"
#include <windows.h>
#include <windowsx.h>
#include <stdlib.h>

struct sRectangle
{

    HDC rectDC;
    //Draw a rectangle - width, height, x, y, color (use teh RGB(r,g,b) function)
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
#endif