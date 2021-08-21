#Include "windows.bi"

Type cWindow Extends Object

    Declare Function Init() As Boolean
    Declare Function Broadcast() As Boolean
    Declare Function Release() As Boolean
    Declare Function isRun() As Boolean

    Declare Virtual Sub onCreate() 
    Declare Virtual Sub onUpdate() 
    Declare Virtual Sub onDestroy() 
     
    
    Dim As Integer mWidth = 480
    Dim As Integer mHeight = 480
    
    Dim As String mTitle = "Apollo Window"
     
    dim wMsg as MSG
    dim wcls as WNDCLASS     
    dim hWnd as HWND

    dim m_is_run as Boolean

End Type


function WndProc ( byval hWnd as HWND, _
                   byval wMsg as UINT, _
                   byval wParam as WPARAM, _
                   byval lParam as LPARAM ) as LRESULT
    
    function = 0
    
    select case( wMsg )
        case WM_CREATE            
            exit function
    	case WM_DESTROY
            Dim As cWindow m_cwindow 
		    m_cWindow.onDestroy()
    		PostQuitMessage( 0 )
            exit function
    end select
    
    function = DefWindowProc( hWnd, wMsg, wParam, lParam )    
    
end function


Function cWindow.Init() As Boolean 
    Dim hInstance As HINSTANCE = GetModuleHandle( null )
    Dim iCmdShow As integer =SW_NORMAL  

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
       exit function
    end if

    hWnd = CreateWindowEx( 0, _
    			 		   @"HelloWin", _
                           mTitle, _
                           WS_OVERLAPPEDWINDOW, _
                           CW_USEDEFAULT, _
                           CW_USEDEFAULT, _
                           mWidth, _
                           mHeight, _
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

End Function

Sub cWindow.onCreate
End Sub

Sub cWindow.onUpdate
End Sub

Sub cWindow.onDestroy
    m_is_run = false
End Sub

Function cWindow.isRun() As Boolean
    return m_is_run
End Function

Function cWindow.broadcast() As Boolean
	Dim As MSG msg

	
	while( GetMessage( @msg, NULL, 0, 0 ) <> FALSE )    
        TranslateMessage( @msg )
        DispatchMessage( @msg )
    wend

	onUpdate()

	Sleep(1)

	return true
End Function
