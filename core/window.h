#ifndef WINDOW_H
#define WINDOW_H
#include <windows.h>
#include <windowsx.h>
#include <stdlib.h>
#define WIN32_LEAN_AND_MEAN
#define WIN_CLASS_NAME "MyClass" // window class name
#define KEYSTATE(n) ((GetAsyncKeyState(n) & 0x8000) ? TRUE: FALSE)

//Device contexts
HDC hMainDC;
HDC memoryDC;
// Window Handler
HWND hwnd;          
//Window Elements method
void addElements();
//LPARAM
LPARAM lp;
//Window Struct
struct GameWindow
{
	//Window Creation Function
	bool initWindow(LPCSTR lTitle, int nWidth, int nHeight);
	//Methods
	void onCreate(); 
	void onDraw();
	void onDestroy();
	
	int getWidth();
	int getHeight();

	WNDCLASSEX winclass; // Window class
	MSG msg;             // The message variable
	DWORD nStartTime;
};


LRESULT CALLBACK WindowProc(HWND hwnd, UINT msg, WPARAM wparam, LPARAM lparam)
{

	PAINTSTRUCT ps;  // PaintStrcut Variable
	HDC hdc;         // Device context handle
	lp = lparam;
	switch(msg)
	{
		case WM_CREATE:  // On Create Method
			return(0);
			break;

		case WM_PAINT:	// On Draw Method
			hdc = BeginPaint(hwnd, &ps);  // Validate window
			EndPaint(hwnd, &ps);          // Release DC
			return(0);
			break;

		case WM_DESTROY: // On Destroy Method
			PostQuitMessage(0);    
			return(0);
			break;

		case WM_CLOSE:	// Confirm quit
			// Create a Message Box if you want to quit
			if (MessageBox(hwnd, "Are you sure you want to quit?",
				"Quit?", MB_YESNO | MB_ICONQUESTION |
				MB_DEFBUTTON2) == IDYES)
				return(DefWindowProc(hwnd, msg, wparam, lparam));
			else
				return(0);
			break;
	}

	// Call the default message handler for anything else
	return(DefWindowProc(hwnd, msg, wparam, lparam));
}

bool GameWindow::initWindow(LPCSTR lTitle, int nWidth, int nHeight)
{

	winclass.cbSize =        sizeof(WNDCLASSEX);
	winclass.style =         CS_DBLCLKS | CS_OWNDC | CS_HREDRAW | CS_VREDRAW;
	winclass.lpfnWndProc =   WindowProc;     // message handler
	winclass.cbClsExtra =    0;              // extra class info
	winclass.cbWndExtra =    0;              // extra window info
	winclass.hInstance =     NULL;	     // application handle
	winclass.hIcon =         LoadIcon(NULL, IDI_WINLOGO);
	winclass.hCursor =       LoadCursor(NULL, IDC_ARROW);
	winclass.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH);
	winclass.lpszMenuName =  NULL;           // no menu, thanks
	winclass.lpszClassName = WIN_CLASS_NAME; // identifier
	winclass.hIconSm =       LoadIcon(NULL, IDI_WINLOGO); // small icon
	
	// Register class
	if (!RegisterClassEx(&winclass))
		return(0);
	
	// Create a window
	if (!(hwnd = CreateWindowEx(NULL,            // extended style
			     WIN_CLASS_NAME,                 // class identifier
				 lTitle, // window title
				 WS_OVERLAPPEDWINDOW | WS_VISIBLE,
				                                 // parameters
				 CW_USEDEFAULT, CW_USEDEFAULT,   // initial position (I think I forgot to tell you that you can do this, heh, sorry)
				 nWidth, nHeight,                // initial size
				 NULL,                           // handle to parent (desktop)
				 NULL,                           // handle to menu (none)
				 NULL,                      // app handle
				 NULL)))                         // extra parameters
		return(0);
	
	hMainDC = GetDC(hwnd);

	// Initialize 
	
    onCreate();
          
	SetWindowLong(hwnd, GWL_STYLE, GetWindowLong(hwnd, GWL_STYLE)&~WS_SIZEBOX);

    HBITMAP hBitmap = CreateCompatibleBitmap(hMainDC,nWidth, nHeight);
	
	SetWindowLong(hwnd, GWL_STYLE, GetWindowLong(hwnd, GWL_STYLE) & ~WS_MAXIMIZEBOX);


	memoryDC = CreateCompatibleDC(hMainDC);
		
	// Main loop 
	while(TRUE)
	{
		
		// Check the message queue
		if (PeekMessage(&msg,NULL,0,0,PM_REMOVE))
		{
			if (msg.message == WM_QUIT) // exit loop on quit
				break;

			// send the message on its merry way
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}

		
		ReleaseDC(hwnd, hMainDC);
		
		SelectObject(memoryDC, hBitmap);
		
		DeleteObject(hBitmap);
		
		SelectObject(memoryDC,GetStockObject(WHITE_BRUSH));

		Rectangle(memoryDC, 0, 0, nWidth, nHeight);

		// Check the time  
		nStartTime = GetTickCount();

		// Update the display 

		onDraw();

		// Lock to 30 FPS - 33ms per frame
		while ((GetTickCount() - nStartTime) < 33);

		// Post a WM_CLOSE message if ESC key is being pressed
		if (KEYSTATE(VK_ESCAPE))
			PostMessage(hwnd, WM_CLOSE, 0, 0);
			
		
		//Copy back buffer images to main buffer

		BitBlt(hMainDC, 0, 0, nWidth, nHeight, memoryDC, 0, 0, SRCCOPY);

	}

	InvalidateRect(hwnd, NULL, FALSE);

	DeleteDC(memoryDC);
	
	onDestroy();
	
	// Release the device context
	ReleaseDC(hwnd, hMainDC);

	// Return to Windows - this is the exit code of the WM_QUIT message
	return(msg.wParam);
}

int GameWindow::getWidth()
{
	int width;
	RECT rect;
	if(GetWindowRect(hwnd, &rect))
	{
  		width = rect.right - rect.left;
	}
	return  width;
}

int GameWindow::getHeight()
{
	int height;
	RECT rect;
	if(GetWindowRect(hwnd, &rect))
	{
  		height = rect.bottom - rect.top;
	}
	return  height;
}
#endif