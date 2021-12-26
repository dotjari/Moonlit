#Include once "windows.bi"
#Include once "Globals.bas"

Function isKeyPressed(ByVal vk as integer) As  SHORT 
	return (GetAsyncKeyState(vk))
End Function