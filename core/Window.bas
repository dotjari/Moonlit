#ifndef WINDOW_BAS
#define WINDOW_BAS
#Include once "windows.bi"
#Include once "Globals.bas"

Type cWindow

    Declare Function initWindow(ByVal sTitle as LPCSTR, ByVal nWidth as Integer, ByVal nHeight as Integer) As Boolean

    Declare Sub onCreate() 
    Declare Sub onDraw() 
    Declare Sub onDestroy() 


    dim m_is_run as Boolean

End Type

Function WndProc(hWnd As HWND, message As UINT, wParam As wPARAM,lParam As LPARAM) As LRESULT

    Static a as cWindow
    Select Case message
    Case WM_CHAR
        If (wParam = VK_ESCAPE) Then
          SendMessage hWnd, WM_CLOSE, 0, 0
        End If
        Return 0
       
    Case WM_CREATE:
        hdc = GetDC(hWnd)
        '' Creates a dib buffer for PintaObjeto. pMainDIB is a pointer to it
        bufDIBDC = CreateCompatibleDC (hdc)
        hMainDIB = CreateDIBSection(hdc,Cast(Any Ptr, @bi), DIB_RGB_COLORS, @pMainDIB, NULL, 0)
        hOldDIB  = SelectObject (bufDIBDC, hMainDIB)
       
        '' Free device context
        ReleaseDC (hWnd, hdc)
       
        a.onCreate()
        SetTimer (hWnd, cdIdTimer, 20, NULL)
        Return 0
   
    Case WM_TIMER :
        InvalidateRect (hWnd, NULL, FALSE)
        Return 0

        Case WM_SIZE :
        vdxClient = lParam And &hFFFF
        vdyClient = lParam Shr &h10
        Return 0

    Case WM_PAINT :
        hdc = BeginPaint(hWnd, @ps)
        a.onDraw()
        bResult = StretchBlt (hdc, 0, 0, vdxClient, vdyClient, bufDIBDC, 0, 0, cdXSize, cdYSize, SRCCOPY)
        EndPaint(hWnd, @ps)
        Return 0

    Case WM_DESTROY
        KillTimer (hWnd, cdIdTimer)
        a.onDestroy()
        hGDITmp = SelectObject (bufDIBDC, hOldDIB)
        bResult = DeleteDC (bufDIBDC)
        bResult = DeleteObject (hMainDIB)
        PostQuitMessage (0)
        Return 0
    End Select

    Return DefWindowProc (hWnd, message, wParam, lParam)
End Function

Function  cWindow.initWindow(ByVal sTitle as LPCSTR, _
    ByVal nWidth as Integer, ByVal nHeight as Integer) As Boolean

    Dim As  RECT   WRect
    Static As String szAppName:szAppName = "SWGPTG"
    Dim As HWND         hWnd
    Dim As MSG          msg
    Dim As WNDCLASS     wndclass
    wndclass.style         = CS_HREDRAW Or CS_VREDRAW
    wndclass.lpfnWndProc   =  @WndProc
    wndclass.cbClsExtra    = 0
    wndclass.cbWndExtra    = 0
    wndclass.hbrBackground = cdColFondo
    wndclass.lpszMenuName  = NULL
    wndclass.lpszClassName = Strptr(szAppname)
    wndclass.hInstance     = GetModuleHandle (NULL)
    wndclass.hIcon         = LoadIcon( NULL, IDI_APPLICATION )
    wndclass.hCursor       = LoadCursor( NULL, IDC_ARROW )

    If RegisterClass (@wndclass) =0 Then
        MessageBox (NULL, "This program requires Windows NT!", _
        "Error", MB_ICONERROR)
        Return 0
    End If
   
   
    SetRect (@WRect, 0, 0, nWidth, nHeight)
    AdjustWindowRectEx (@WRect, cdVBtnTipo, 0, cdVBarTipo)
    WRect.bottom -= WRect.top
    WRect.right  -= WRect.left
    WRect.left    = (GetSystemMetrics (SM_CXSCREEN) - WRect.right)/2
    WRect.top     = (GetSystemMetrics (SM_CYSCREEN) - WRect.bottom) / 3
   
    hWnd = CreateWindowex(0,szAppname ,sTitle, _
    cdVBtnTipo , _
    WRect.left,WRect.top,WRect.right,WRect.bottom, _
    NULL, NULL, NULL, NULL)
   
    ShowWindow (hWnd, SW_NORMAL)
    UpdateWindow (hWnd)
   
    While (GetMessage (@msg, NULL, 0, 0))
        TranslateMessage (@msg)
        DispatchMessage (@msg)
    Wend
   
    Return msg.wParam
End Function
#endif