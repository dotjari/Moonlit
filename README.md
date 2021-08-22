# Apollo
A small game engine for RPGs and ADVENTUREs made in Freebasic for my game, Versis.
This Game Engine uses WinAPI as the main API for graphics and audio.

# Syntax
How to create a simple window:
```basic
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
#TODO List:
* [x] Window Creator
* [ ] Basic Graphics (Circles, Rectangles, etc.)
* [ ] Sprite Loader
* [ ] Sprite Renderer
* [ ] Double Buffering
* [ ] Audio Loader
* [ ] Audio player
* [ ] MultiThreading
* [ ] Colision Detecting
* [ ] Interpreter for Game Event Script
