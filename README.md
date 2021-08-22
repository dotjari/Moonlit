# Apollo
A small game engine for RPGs and ADVENTUREs made in Freebasic for my game, Versis.
This Game Engine uses WinAPI as the main API for graphics and audio.

<h3>Syntax</h3>
How to create a simple window:
```freebasic
'Include the Engine
#include "AppWindow.bas"

'Declare the Application Window object
Dim As AppWindow app

'If the application initialized...
if (app.init()) Then
	'And if the app is running...
	while (app.isRun())
		'run the main scene
		app.broadcast()
	wEnd
EndIf
```
