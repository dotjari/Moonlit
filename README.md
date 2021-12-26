# Moonlit
A small game engine for **RPG**s and **ADVENTURE**s made in **FreeBasic** for my game, **Versis**.
This Game Engine uses WinAPI as the main API for graphics and audio.

# Syntax
How to create a simple window:
```vb
#include "core/Window.bas"
#include "core/Keyboard.bas"
#include "core/Graphics.bas"

Dim win As cWindow
Sub cWindow.onCreate()

End Sub

Sub cWindow.onDraw()

End Sub

Sub cWindow.onDestroy()

End Sub

win.initWindow("Test",800,600)

```
# Built with
1. [Freebasic](https://www.freebasic.net/) - The BASIC Dialect i use
2. [WinAPI] - The normal Microsoft Windows Application Programming Interface


## How to Contribute
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Please make sure to update tests as appropriate. If you'd like to contribute, please fork the repository and make changes as you'd like. Pull requests are warmly welcome.

Steps to contribute:
1. Fork this repository (link to your repository)
2. Create your feature branch (git checkout -b feature/fooBar)
3. Commit your changes (git commit -am 'Add some fooBar')
4. Push to the branch (git push origin feature/fooBar)
5. Create a new Pull Request

# TODO List:
* [x] Window Creator
* [ ] Basic Graphics (Circles, Rectangles, etc.)
* [ ] Sprite Loader
* [ ] Sprite Renderer
* [x] Double Buffering
* [ ] Audio Loader
* [ ] Audio player
* [ ] MultiThreading
* [ ] Colision Detecting
* [ ] Interpreter for Game Event Script

# Credits
The resources i used:
1. [Microsoft Docs] (https://docs.microsoft.com/)
2. [Freebasic Docs] (https://www.freebasic.net/)
3. [Stack Overflow] (https://stackoverflow.com/)
