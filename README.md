# Apollo
A small game engine for RPGs and ADVENTUREs made in Freebasic for my game, Versis.
This Game Engine uses WinAPI as the main API for graphics and audio.

Syntax:
```basic
#include "AppWindow.bas"

Dim As AppWindow app

if (app.init()) Then
	while (app.isRun())
		app.broadcast()
	wEnd
EndIf
```
