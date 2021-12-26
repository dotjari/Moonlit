#Include once "windows.bi"
#Include once "win/wingdi.bi"
#define cdXPos          CW_USEDEFAULT
#define cdYPos          CW_USEDEFAULT
#define cdXSize         640 '//cdYSize*1.6
#define cdYSize         400
#define cdColFondo      0
#define MAIN_ICON       100   ' //  IDI_APPLICATION
#define cdVCursor       IDC_ARROW
#define cdVBarTipo      0
#define cdVBtnTipo      WS_OVERLAPPEDWINDOW
#define cdIdTimer       1
Dim Shared As Ulong Ptr pMainDIB
Dim Shared As Integer vdxClient, vdyClient
Dim Shared As BITMAPINFOHEADER bi = Type(Sizeof(BITMAPINFOHEADER),cdXSize,-cdYSize,1,32,0,0,0,0,0,0)
Dim Shared As Long vdMotion
Static Shared As HDC  bufDIBDC
Static Shared As HBITMAP hMainDIB
Dim Shared As HDC hdc
Dim Shared As HWND hWnd
Dim Shared As PAINTSTRUCT ps
Static Shared  As HGDIOBJ hOldDIB = 0 
Static Shared  As HGDIOBJ hGDITmp
Dim Shared As Integer bResult
   