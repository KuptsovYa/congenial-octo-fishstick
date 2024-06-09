include main.inc
;----------------------
include obj_fruit.asm
include obj_snake.asm
include engine.asm
include interface.asm

.code
start:
     fn SetConsoleTitle,"Snake demo"
     ;-----------------
     fn SetWindowSize,MAX_WIDTH,MAX_HEIGHT
     ;-----------------
     fn HideCursor
     ;-----------------
     fn Main
     ;-----------------    
     exit
;******************************************
Main proc 

     fn MainMenu
     ;-----------------------
     .while closeConsole == 0
        ;------------------------------------
        fn GameInit
        ;------------------------------------
           .while gameOver == 1
            
            fn GameUpdate
            fn GameController

          .endw
       ;---------------------
       fn MainMenu
    .endw
    ;------------------------
    fn gotoxy,25,40
	ret
Main endp
;*******************************************
gotoxy proc uses ebx esi edi x:DWORD,y:DWORD

    mov ebx,y
    shl ebx,16
    or ebx,x
    ;----------------------------------------
    fn SetConsoleCursorPosition,rv(GetStdHandle,-11),ebx
    ;----------------------------------------
	ret
gotoxy endp
HideCursor proc uses ebx esi edi
    LOCAL ci:CONSOLE_CURSOR_INFO

    fn GetStdHandle,-11
    ;-----------------------------
    push eax
    lea ebx,ci
    ;-----------------------------
    fn  GetConsoleCursorInfo,eax,ebx
    ;-----------------------------
    mov ci.bVisible,0
    ;-----------------------------
    pop eax
    ;------------------------------
    fn  SetConsoleCursorInfo,eax,ebx
    ;------------------------------
	ret
HideCursor endp
SetWindowSize proc uses ebx esi edi wd:DWORD,ht:DWORD

    fn GetStdHandle,-11
    ;----------------------------------
    push eax
    ;----------------------------------
    mov ebx,ht
    shl ebx,16
    ;----------------------------------
    or ebx,wd
    ;----------------------------------
    fn  SetConsoleScreenBufferSize,eax,ebx
    ;----------------------------------
    pop eax
    ;-----------------------------------
    fn SetConsoleWindowInfo,eax,1,offset srect
    ;-----------------------------------
	ret
SetWindowSize endp

;******************************

SetColor proc uses ebx esi edi cref:DWORD
    
    fn SetConsoleTextAttribute, rv(GetStdHandle, -11), cref

	Ret
SetColor endp
;************************************
CheckPosition proc uses ebx esi edi x:DWORD, y:DWORD
    
    LOCAL cRead:DWORD
    LOCAL buffer:DWORD
    

    mov dword ptr[buffer], 0
    ;----------------------------
    fn gotoxy, x, y
    ;----------------------------
    mov ebx, y
    shl ebx, 16
    or ebx, x
    ;----------------------------
    lea edi, cRead 
    lea esi, buffer
    ;----------------------------
    fn GetStdHandle, -11
    ;----------------------------
    fn ReadConsoleOutputCharacter, eax, esi, 1, ebx, edi
    mov eax, dword ptr[buffer]   
    
	Ret
CheckPosition endp
;************************************


end start
