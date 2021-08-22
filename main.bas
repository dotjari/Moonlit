#include "AppWindow.bas"

Dim As AppWindow app
app.mWidth = 333

if (app.init()) Then
	while (app.isRun())
		app.broadcast()
	wEnd
EndIf