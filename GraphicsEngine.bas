'#include "windows.bi"

Type GraphicsEngine

    Declare Function Init(ByVal hWnd As HWND) As Boolean
    Declare Function Release(ByVal hWnd As HWND) As Boolean

    Dim As HDC hdc
    Dim As PAINTSTRUCT ps

End Type

Function GraphicsEngine.Init(ByVal hWnd As HWND) As Boolean

    hdc = BeginPaint(hWnd, @ps)

End Function

Function GraphicsEngine.Release(ByVal hWnd As HWND) As Boolean

    EndPaint(hWnd, @ps)

End Function

    
