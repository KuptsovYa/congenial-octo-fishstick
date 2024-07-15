include congame.inc

.code

gotoxy proc uses ebx esi edi x:DWORD,y:DWORD

    mov ebx,y
    shl ebx,16
    or ebx,x
    ;----------------------------------------
    fn SetConsoleCursorPosition,rv(GetStdHandle,-11),ebx
    ;----------------------------------------
	ret
gotoxy endp
HideConsoleCursor proc uses ebx esi edi
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
HideConsoleCursor endp
SetConsoleWindowSize proc uses ebx esi edi wd:DWORD,ht:DWORD
    
    LOCAL srect:SMALL_RECT
    
    mov word ptr[srect.Left], 0
    mov word ptr[srect.Top], 0
    mov eax, wd
    dec eax
    mov word ptr[srect.Right], ax
    mov eax, ht
    dec eax
    mov word ptr[srect.Bottom], ax
    
    
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
    ;----------------------------------
    lea ebx, srect
    ;-----------------------------------
    fn SetConsoleWindowInfo,eax,1, ebx
    ;-----------------------------------
	ret
SetConsoleWindowSize endp

;******************************

SetConsoleColor proc uses ebx esi edi cbkg:DWORD, cfrg:DWORD
    
    mov ebx, cbkg
    shl bl, 4
    ;-----------------------
    mov eax, cfrg
    ;-----------------------
    or bl, al    
    
    fn SetConsoleTextAttribute, rv(GetStdHandle, -11), ebx

	Ret
SetConsoleColor endp
;************************************
CreateObject proc uses ebx esi edi lpObj:DWORD,x:DWORD,y:DWORD,spd:DWORD,vspd:DWORD,hspd:DWORD,grav:DWORD,_dir:DWORD,lv:DWORD,hp:DWORD,spr:DWORD

    mov esi, lpObj
    assume esi: ptr GAME_OBJECT
    ;---------------------------------
    mov eax, x
    mov dword ptr[esi].obj.x, eax
    mov dword ptr[esi].obj.xstart, eax
    ;---------------------------------
    mov eax, y
    mov dword ptr[esi].obj.y, eax
    mov dword ptr[esi].obj.ystart, eax
    ;---------------------------------
    mov eax, spd
    mov dword ptr[esi].speed, eax
    ;---------------------------------
    mov eax, vspd
    mov dword ptr[esi].vspeed, eax
    ;---------------------------------    
    mov eax, hspd
    mov dword ptr[esi].hspeed, eax
    ;---------------------------------
    mov eax, grav
    mov dword ptr[esi].gravity, eax
    ;---------------------------------
    mov eax, _dir
    mov byte ptr[esi].direction, al
    ;---------------------------------
    mov eax, lv
    mov byte ptr[esi].lives, al
    ;---------------------------------
    mov eax, hp
    mov byte ptr[esi].health, al
    ;---------------------------------
    mov eax, spr
    mov byte ptr[esi].sprite, al
    ;---------------------------------
    
    assume esi:nothing
	Ret
CreateObject endp
;*******************************************
CheckCursorPosition proc uses ebx esi edi x:DWORD, y:DWORD
    
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
CheckCursorPosition endp
;************************************

GamePause proc uses ebx esi edi x:DWORD, y:DWORD, cbkg:DWORD

    LOCAL hOut:DWORD
    
    mov hOut, rv(GetStdHandle, -11)
    ;-------------------------------    
    
@@Pause:
        
        fn SetConsoleColor, cbkg, LightCyan
        ;---------------------------
        fn gotoxy, x, y
        ;---------------------------
        fn crt_puts, "PAUSE"
        ;---------------------------
        fn Sleep, 500
        
        
        fn SetConsoleColor, cbkg, LightGreen
        ;---------------------------
        fn gotoxy, x, y
        ;---------------------------
        fn crt_puts, "pause"
        ;---------------------------
        fn Sleep, 500
        
        fn Keyboard_check
        
        cmp al, 'p'
        jne @@Pause
        ;---------------------------
        fn gotoxy, x, y
        ;---------------------------
        fn crt_puts, "     "

	Ret
GamePause endp
;**************************************
DrawLevel proc uses ebx esi edi lpLvl:DWORD, cbkg:DWORD, cfrg:DWORD
    LOCAL hFile:DWORD
    LOCAL buffer[256]:BYTE
        
        fn crt_fopen, lpLvl, "r"
        ;------------------------------------
        or eax, eax
        je @@Ret
        ;------------------------------------
        mov dword ptr[hFile], eax        
        ;------------------------------------
        push eax
        ;------------------------------------
        fn SetConsoleColor, cbkg, cfrg
        ;------------------------------------
        lea ebx, buffer
        
        
    @@While:
    
        fn crt_fgets, ebx, 256, hFile
        ;------------------------------
        or eax, eax
        ;--------------------------------
        je @@CloseFile
        ;--------------------------------
        fn crt_printf, eax
        jmp @@While
        ;--------------------------------
    @@CloseFile:
        pop eax
        ;--------------------------------
        fn crt_fclose, eax
        ;--------------------------------
        inc eax
        
    
@@Ret:
	Ret
DrawLevel endp
;*******************************************
Play_sound proc uses ebx esi edi lpFile:DWORD, dwLoop:DWORD
     
    .if dwLoop == 0
     
        fn PlaySound,lpFile,0,SND_FILENAME or SND_ASYNC

    .else
    
        fn PlaySound,lpFile,0,SND_FILENAME or SND_ASYNC or SND_LOOP
    
    .endif
    
	ret
Play_sound endp
;*******************************************
Keyboard_check_pressed proc uses ebx esi edi

   fn FlushConsoleInputBuffer,rv(GetStdHandle,-10)
   ;-----------------------------------------
@@:
   fn Sleep,1
   fn crt__kbhit
   ;-------------
   or eax,eax
   je @B
   ;------------
   fn crt__getch
   ;------------
   
   ret
Keyboard_check_pressed endp
;***********************************************************

Keyboard_check proc uses ebx esi edi

    ;----------------------------
    fn crt__kbhit
    ;----------------------------
    or eax, eax
    jz @@Ret
    ;----------------------------
    fn crt__getch
    
@@Ret:
	Ret
Keyboard_check endp
;*************************************
DrawScore proc uses ebx esi edi x:DWORD, y:DWORD, cbkg:DWORD, cfrg:DWORD, scr:DWORD

    mov ebx, scr
    ;---------------------------
    fn gotoxy, x, y
    fn SetConsoleColor, cbkg, cfrg
    ;---------------------------
    print ustr$(ebx)
    ;---------------------------

	Ret
DrawScore endp
;************************************
RangedRand proc uses ebx esi edi _min:DWORD, _max:DWORD
    
    LOCAL res:DWORD
    
    fn crt_rand
    ;-----------------------------
    mov dword ptr[res], eax
    ;-----------------------------
    fild dword ptr[res]
    ;-----------------------------
    fld qword ptr[rand_max]
    ;-----------------------------
    fdivp st(1), st
    ;-----------------------------
    mov eax, _max
    sub eax, _min
    ;-----------------------------
    mov dword ptr[res], eax
    ;-----------------------------
    fild dword ptr[res]
    fmulp st(1), st
    ;-----------------------------
    fild dword ptr[_min]
    ;-----------------------------
    faddp st(1), st
    ;-----------------------------
    fistp dword ptr[res]
    ;-----------------------------
    mov eax, dword ptr[res]
    ;-----------------------------
	Ret
RangedRand endp
end
