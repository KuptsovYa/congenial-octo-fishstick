include main.inc
include engine.asm
include interface.asm
include obj_snake.asm

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
     fn SetConsoleTextAttribute,rv(GetStdHandle,-11),LightRed
     ;-----------------
     inkey
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
end start