#include "Window.bas"
#include "GraphicsEngine.bas"

Type AppWindow Extends cWindow
    Dim As GraphicsEngine graph
    Dim As cWindow wind
    Declare Virtual Sub onCreate() Override
    Declare Virtual Sub onUpdate() Override
    Declare Virtual Sub onDestroy() Override
End Type

Sub AppWindow.onCreate()
    
    wind.onCreate()
    graph.Init(wind.hWnd)

End Sub

Sub AppWindow.onUpdate()

    wind.onUpdate()

End Sub

Sub AppWindow.onDestroy()
    graph.Release(wind.hWnd)
    wind.onDestroy()
End Sub
'