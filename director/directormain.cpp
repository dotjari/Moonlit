#define VERSION "0.1.0"
#include "../core/window.h"
#include "../core/graphics.h"
#include "../core/gamecore/Image.h"
#include "../core/gui.h"
#include <stdio.h>
#include <stdlib.h>

Image file;
Menu menu;
GameWindow Win;
sRectangle rect;
void GameWindow::onCreate()
{ 
    file.Load("director/gui/window/save.bmp");
    menu.addParent(L"File");
    menu.addChild(L"New");
    menu.addSeparator();
    menu.addChild(L"Quit");

    printf("Window Size :%d ",Win.getWidth());
    printf(" * %d\n", Win.getHeight());
}
void GameWindow::onDraw()
{   
    rect.Draw(640,480,0,0,RGB(255,0,0));
    file.Draw(0, 0, 64,64);

}
void GameWindow::onDestroy()
{ 
    menu.Destroy();
    file.Destroy();
}


int main(int argc, char**argv[])
{
	Win.initWindow("Moonlit Director 0.1",1280,720);
	return 0;
}
