#ifndef DIALOG_H
#define DIALOG_H
#include <windows.h>
#include "../window.h"

struct Dialog 
{
    //Types of dialog
    void TextBox(LPCSTR text); //Example: https://imgur.com/a/QzmDaoP
    //void FullScreenBox(); //Example: https://imgur.com/a/x7lbff6

    //System("pause") for dialog
    void Pause(); 

    //Create a Color Brush
    HBRUSH hBrush = CreateSolidBrush(RGB(15,0,255));
};

void Dialog::Pause()
{
    if(GetAsyncKeyState(VK_UP))
        delete this;
}

void Dialog::TextBox(LPCSTR text)
{
    // In the future, I want to place the horizontal based on the window size percentages
    RECT rc;
    rc.left = 10;
    rc.top = 336;
    rc.right = 775;
    rc.bottom = 600;

    //Create a rectangle
    FillRect(memoryDC,&rc,hBrush);
    //Draw Text
    ExtTextOut(memoryDC, rc.left+15, rc.top+15, ETO_OPAQUE, TA_LEFT,  text, 0, NULL);
}
#endif
