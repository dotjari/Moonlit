#Include "windows.bi"

function WndProc ( byval hWnd as HWND, _
                   byval wMsg as UINT, _
                   byval wParam as WPARAM, _
                   byval lParam as LPARAM ) as LRESULT
    
    function = 0
    
    select case( wMsg )
        case WM_CREATE            
            exit function

        case WM_PAINT
    		dim rct as RECT
    		dim pnt as PAINTSTRUCT
    		dim hDC as HDC
          
            hDC = BeginPaint( hWnd, @pnt )
            GetClientRect( hWnd, @rct )
            
		'draw
            
            EndPaint( hWnd, @pnt )
            
            exit function            
        
		case WM_KEYDOWN
			if( lobyte( wParam ) = 27 ) then
				PostMessage( hWnd, WM_CLOSE, 0, 0 )
			end if

    	case WM_DESTROY
            PostQuitMessage( 0 )
            exit function
    end select
    
    function = DefWindowProc( hWnd, wMsg, wParam, lParam )    
    
end function


Sub InitWindow ( ByVal WTitle As String, _
                ByVal WWidth As Integer, _
                ByVal WHeight As Integer, _
                ByVal WX As Integer, _
                ByVal WY As Integer)
                
    
    Dim hInstance as HINSTANCE = GetModuleHandle( null )
    Dim hPrevInstance as HINSTANCE = null
    Dim iCmdShow as integer =SW_NORMAL   
                
     
    dim wMsg as MSG
    dim wcls as WNDCLASS     
    dim hWnd as HWND
     
    with wcls
    	.style         = CS_HREDRAW or CS_VREDRAW
    	.lpfnWndProc   = @WndProc
    	.cbClsExtra    = 0
    	.cbWndExtra    = 0
    	.hInstance     = hInstance
    	.hIcon         = LoadIcon( NULL, IDI_APPLICATION )
    	.hCursor       = LoadCursor( NULL, IDC_ARROW )
    	.hbrBackground = GetStockObject( WHITE_BRUSH )
    	.lpszMenuName  = NULL
    	.lpszClassName = @"HelloWin"
    end with
          
    if( RegisterClass( @wcls ) = FALSE ) then
       MessageBox( null, "Failed to register wcls", "Error", MB_ICONERROR )
       exit sub
    end if
    
    hWnd = CreateWindowEx( 0, _
    			 		   @"HelloWin", _
                           WTitle, _
                           WS_OVERLAPPEDWINDOW, _
                           CW_USEDEFAULT, _
                           CW_USEDEFAULT, _
                           CW_USEDEFAULT, _
                           CW_USEDEFAULT, _
                           NULL, _
                           NULL, _
                           hInstance, _
                           NULL )
                          

    ShowWindow( hWnd, iCmdShow )
    UpdateWindow( hWnd )
     
    while( GetMessage( @wMsg, NULL, 0, 0 ) <> FALSE )    
        TranslateMessage( @wMsg )
        DispatchMessage( @wMsg )
    wend
    
    'function = wMsg.wParam
     MoveWindow(hWnd, WX, WY, WWidth, WHeight, False)

End Sub
