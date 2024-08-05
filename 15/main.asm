include main.inc

.code
start:

    fn GetModuleHandle,0
    mov dword ptr[hInstance], eax
    ;--------------------------------------------
    fn GetCommandLine
    ;--------------------------------------------
    fn WinMain, hInstance, 0, eax, SW_SHOW
    ;--------------------------------------------
    fn ExitProcess, eax
    ;--------------------------------------------
    
WinMain proc hInst:DWORD, hPrev:DWORD, lpCmdLine:DWORD, fShow:DWORD

    LOCAL wc:WNDCLASSEX
    LOCAL msg:MSG
    
    ;==================== CLASS REGISTER ====================
    
    mov dword ptr[wc.cbSize], sizeof WNDCLASSEX
    mov wc.style, CS_HREDRAW or CS_VREDRAW
    mov wc.cbClsExtra, 0
    mov wc.cbWndExtra, 0
    ;-----------------------------------
    mov wc.lpfnWndProc, offset WindowProc
    ;-----------------------------------
    push hInst
    pop wc.hInstance
    ;-----------------------------------
    fn LoadIcon, 0, 32518
    ;-----------------------------------
    mov wc.hIcon, eax
    mov wc.hIconSm, eax
    ;-----------------------------------
    fn LoadCursor, 0, 32512
    ;-----------------------------------
    mov wc.hCursor, eax
    ;-----------------------------------
    mov wc.hbrBackground, COLOR_BACKGROUND+1
    ;-----------------------------------
    mov wc.lpszMenuName, 0
    ;-----------------------------------
    mov wc.lpszClassName, offset szClassName
    ;-----------------------------------
    fn RegisterClassEx, addr wc
    ;-----------------------------------
    mov ebx, eax
    ;-----------------------------------
    fn CreateWindowEx, 0, ebx, offset szTitle, WS_OVERLAPPEDWINDOW, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, 0, 0, hInst, 0
    
    ;-----------------------------------
    fn UnregisterClass, ebx, hInst
    ;-----------------------------------
    push msg.wParam
    pop eax
    
    
	Ret
WinMain endp
    

end start