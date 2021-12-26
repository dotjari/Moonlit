#include "core/Window.bas"
#include "core/Keyboard.bas"
#include "core/Graphics.bas"

Dim win As cWindow
Dim Shared x As Integer = 0
Sub cWindow.onCreate()
End Sub
Sub cWindow.onDraw()
    Rectangle(bufDIBDC,x,0,x+32,32)
    if(isKeyPressed(VK_RIGHT)) then
        x+= 1
    Endif
End Sub
Sub cWindow.onDestroy()
End Sub

win.initWindow("sexooo",800,600)