

GameInit                    proto
GameUpdate                  proto
DrawLevel                   proto :DWORD
Play_sound                  proto :DWORD
Keyboard_check_pressed      proto
Keyboard_check              proto
GameController              proto
KeyEvent                    proto
DrawEvent                   proto
DrawScore                   proto
DrawPanel                   proto
StepEvent                   proto


.const
;-------------- Keys -----------------------

KEY_ENTER     equ 13
KEY_ESC       equ 27
MAX_STEP      equ 30

.data
bKey          db 30h
gameOver      db 0
closeConsole  db 0
nLevel        db 1
score         db 0
;---------------------------------
szLevel_1     db "level_1.txt",0 


.code
GameController proc uses ebx esi edi
    
    fn KeyEvent
    ;--------------------------
    fn DrawEvent
    ;--------------------------
    fn StepEvent

	Ret
GameController endp



GameInit proc uses ebx esi edi

    movzx eax,byte ptr[nLevel]        
    fn DrawLevel, eax
    ;---------------------------
    or eax, eax
    ;---------------------------
    je @@Error
    ;---------------------------
    mov dword ptr[snake.x], 40
    mov dword ptr[snake.y], 20
    mov byte ptr[snake.direction], 30h   
    mov dword ptr[snake.speed], MAX_SPEED
    ;---------------------------
    mov dword ptr[score], 0
    ;---------------------------
    fn DrawSnake, snake.x, snake.y
    ;---------------------------    

    


@@Ret:
	Ret
	
@@Error:

    mov byte ptr[gameOver], 0
    ;---------------------------
    fn gotoxy, 32, 19
    fn SetConsoleTextAttribute, rv(GetStdHandle, -11), cBlack
    fn crt_puts, "Load file failed"
    ;---------------------------
    fn Sleep, 2000
    jmp @@Ret

GameInit endp
;*************************************
GameUpdate proc uses ebx esi edi

    LOCAL x:DWORD
    LOCAL y:DWORD
    
    













	Ret
GameUpdate endp

KeyEvent proc uses ebx esi edi

    fn Keyboard_check
    ;--------------------------
    .if byte ptr[bKey] == KEY_ESC
    
        mov byte ptr[gameOver], 0
        mov byte ptr[closeConsole], 1
    
    .elseif byte ptr[bKey] == 'p'
    
    .elseif byte ptr[bKey] == 'w' || byte ptr[bKey] == 's' || byte ptr[bKey] == 'a' || byte ptr[bKey] == 'd'  
    
        mov byte ptr[snake.direction], al
    
    .endif

	Ret
KeyEvent endp
;*************************************

StepEvent proc uses ebx esi edi
    
    .if snake.direction == 30h 
    
        mov byte ptr[gameOver], 0
        ;-------------------------
        ; Game over menu
        ;-------------------------    
        jmp @@Ret
            
    .endif

    
@@Ret:
    fn Sleep, MAX_STEP
	Ret
StepEvent endp

DrawEvent proc uses ebx esi edi

    fn DrawSnake, snake.x, snake.y
    ;-------------------------------
    fn DrawScore
    ;-------------------------------
    fn DrawPanel
    ;-------------------------------
    
	Ret
DrawEvent endp
;*************************************

Keyboard_check proc uses ebx esi edi

    mov byte ptr[bKey], 30h
    ;----------------------------
    fn crt__kbhit
    ;----------------------------
    or eax, eax
    jz @@Ret
    ;----------------------------
    fn crt__getch
    mov byte ptr[bKey], al
    
@@Ret:
	Ret
Keyboard_check endp
;*************************************
DrawScore proc uses ebx esi edi



	Ret
DrawScore endp
;*************************************

DrawPanel proc uses ebx esi edi


	Ret
DrawPanel endp

DrawLevel proc uses ebx esi edi nLvl:DWORD
    LOCAL hFile:DWORD
    LOCAL buffer[256]:BYTE
        
    .if nLvl == 1
    
        fn crt_fopen, offset szLevel_1, "r"
        ;------------------------------------
        or eax, eax
        je @@Ret
        ;------------------------------------
        mov dword ptr[hFile], eax        
        ;------------------------------------
        push eax
        ;------------------------------------
        fn SetConsoleTextAttribute, rv(GetStdHandle, -11), cYellow
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
        mov eax, 1
        
    .endif
    
@@Ret:
	Ret
DrawLevel endp
;************************************


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
   mov byte ptr[bKey],al
   ret
Keyboard_check_pressed endp
;***********************************************************
Play_sound proc uses ebx esi edi lpFile:DWORD

     fn PlaySound,lpFile,0,SND_FILENAME or SND_ASYNC

	ret
Play_sound endp