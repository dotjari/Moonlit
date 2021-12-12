#Moonlit
A small game engine for **RPG**s and **ADVENTURE**s made in **C++** for my game, **Versis**.
This Game Engine uses WinAPI as the main API for graphics and audio.

# Syntax
How to create a simple window:
```cpp
//include the window header
#include "core/window.h"

// window struct
GameWindow Win;

//methods
void GameWindow::onCreate()
{ 
}
void GameWindow::onDraw()
{ 
}
void GameWindow::onDestroy()
{ 
}

//main function
int main(int argc, char**argv[])
{
    //init-window function
	Win.initWindow("Teste",800,600);
	return 0;
}

```
# Built with
1. [Freebasic](https://www.freebasic.net/) - The BASIC Dialect i use
2. [WinAPI] - The normal Microsoft Windows Application Programming Interface
3. [C++] - The Core Programming Language


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
* [/] Basic Graphics (Circles, Rectangles, etc.)
* [/] Sprite Loader
* [/] Sprite Renderer
* [/] Double Buffering
* [ ] Audio Loader
* [ ] Audio player
* [ ] MultiThreading
* [ ] Freebasic Interface
* [ ] Colision Detecting
* [ ] Interpreter for Game Event Script

# FREEBASIC? What the heck?
Yes, i plan to make a interface of this engine to Freebasic. Freebasic is a very powerful language and will be the main language in my game.

# Credits
The resources i used:
1. [Microsoft Docs] (https://docs.microsoft.com/)
2. [Freebasic Docs] (https://www.freebasic.net/)
3. [Stack Overflow] (https://stackoverflow.com/)
