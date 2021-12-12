#ifndef GUI_H
#define GUI_H
#define IDM_FILE_NEW 1
#define IDM_FILE_OPEN 2
#define IDM_FILE_QUIT 3
#include "window.h"
#include <windows.h>
#include <windowsx.h>
#include <stdlib.h>

struct Menu {
    HMENU hMenubar; //Menu bar variable
    HMENU hMenu; //Menu variable
    Menu() //Constructor for our struct
    {
        hMenubar = CreateMenu(); 
    }

    //Wrappers for AppendMenuW
    //Add the category of the menu 
    void addParent(LPCWSTR name)
    {
        hMenu = CreateMenu(); // Create Menu
        AppendMenuW(hMenubar, MF_POPUP, (UINT_PTR) hMenu, name); 
        SetMenu(hwnd, hMenubar); // Set Menu
    }
    //Add the options
    void addChild(LPCWSTR name)
    {
        AppendMenuW(hMenu, MF_STRING, 1, name);
        
    }
    //Add a seperator
    void addSeparator()
    {
        hMenu = CreateMenu();
        AppendMenuW(hMenu, MF_SEPARATOR, 0, NULL);
    }

    void Destroy()
    {
        DestroyMenu(hMenu);
    }
};

//struct of Button type
struct Button {
    
    //Button();
    HWND button; //handle the button
    //add the button - text, x, y, width, height
    void add(LPCSTR text, int x, int y, int w, int h)
    {
        
        button = CreateWindow (
            TEXT("BUTTON"),                         // The class name required
            text,                     // the caption of the label
            WS_CHILD | WS_VISIBLE | BS_NOTIFY,  // the styles
            x, // the left co-ordinates x
            y,  // the top co-ordinates y
            w,  // width
            h,  // height
            hwnd, // parent window handle hwnd
            ( HMENU )NULL, // the ID of your button
            0, // the instance of your application
            NULL)  // extrabits you dont really need
        ;
    }
};

#endif

