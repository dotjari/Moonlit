#include "core/window.h"
#include "core/gamecore/dialog.h"

Dialog dlg;
GameWindow Win;

void GameWindow::onCreate()
{ 
    
    
    
}
void GameWindow::onDraw()
{ 
    dlg.TextBox("sexo");
}
void GameWindow::onDestroy()
{ 
}

int main(int argc, char**argv[])
{
	Win.initWindow("Teste",800,600);
	return 0;
}
