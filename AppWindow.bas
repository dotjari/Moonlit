#include "Window.bas"
Type AppWindow Extends cWindow
    Declare Virtual Sub onCreate() Override
    Declare Virtual Sub onUpdate() Override
    Declare Virtual Sub onDestroy() Override
End Type

Sub AppWindow.onCreate
End Sub

Sub AppWindow.onUpdate
End Sub

Sub AppWindow.onDestroy

End Sub
