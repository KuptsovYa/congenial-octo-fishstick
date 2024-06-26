
GameOverMenu                proto

GameInit                    proto
GameUpdate                  proto

GameController              proto
KeyEvent                    proto
DrawEvent                   proto
ShowScore                   proto
DrawPanel                   proto
StepEvent                   proto

.const
;-------------- Keys -----------------------

KEY_ENTER     equ 13
KEY_ESC       equ 27
MAX_STEP      equ 30

;-------------------------------------------
STOP          equ 30h 

.data
bKey          db 30h
bPlay         db 0
gameOver      db 0
closeConsole  db 0
nLevel        db 1
;---------------------------------
score         dd 0
score_old     dd 0
;---------------------------------
szLevel_1     db "level_1.txt",0 
szGameOver     db "GAME OVER",0
szBack         db "Press ENTER to back to main menu",0

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

    fn crt_srand, rv(crt_time, 0)
    ;---------------------------
    

    .if nLevel == 1
    
        fn DrawLevel, offset szLevel_1, cYellow       
    
    .endif
    ;---------------------------
    or eax, eax
    ;---------------------------
    je @@Error
    ;---------------------------
    fn DrawPanel
    ;---------------------------
    fn SetConsoleColor, LightGreen
    ;---------------------------
    fn gotoxy, 1, 40
    ;---------------------------
    fn crt_printf, "Score: "
    print ustr$(score)
    ;---------------------------
    fn CreateSnake
    ;---------------------------
    fn DrawSnake, snake.x, snake.y
    ;---------------------------    
    fn CreateFruit
    ;---------------------------
    .if bPlay == 0
    
        ;fn mfmPlay, offset music
        inc bPlay
        
    .else 
    
        ;fn mfmPause
    
    .endif
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
    LOCAL xprev:DWORD
    LOCAL yprev:DWORD
    LOCAL xtemp:DWORD
    LOCAL ytemp:DWORD
    ;---------------------
    
    inc spd_count
    ;----------------------
    mov eax, spd_count
    .if eax >= snake.speed
    ;-------------------------------
    
        ;---------------------------
        mov eax, snake.x
        mov dword ptr[x], eax
        ;---------------------------        
        mov eax, snake.y        
        mov dword ptr[y], eax
        ;---------------------------
        
        .if nTail > 0
            lea esi, tail
            ;-----------------------
            mov eax, dword ptr[esi]
            mov dword ptr[xprev], eax
            mov eax, dword ptr[esi+4]
            mov dword ptr[yprev], eax
            ;-----------------------
            mov eax, dword ptr[x]
            mov dword ptr[esi], eax
            mov eax, dword ptr[y]
            mov dword ptr[esi+4], eax
            ;-----------------------
            
            fn gotoxy, xprev, yprev
            fn crt_putchar, 20h
            ;-----------------------
            
            xor ebx, ebx
            inc ebx
            
            add esi, sizeof TAIL
            ;-----------------------
            
            jmp @@For
        @@In:
        
            mov eax, dword ptr[esi]
            mov dword ptr[xtemp], eax
            mov eax, dword ptr[esi+4]
            mov dword ptr[ytemp], eax
            ;-----------------------
            fn gotoxy, xtemp, ytemp
            ;-----------------------
            fn crt_putchar, 20h
            ;-----------------------
            mov eax, dword ptr[xprev]
            mov dword ptr[esi], eax
            mov eax, dword ptr[yprev]
            mov dword ptr[esi+4], eax
            ;-----------------------
            mov eax, dword ptr[xtemp]
            mov dword ptr[xprev], eax
            ;-----------------------
            mov eax, dword ptr[ytemp]
            mov dword ptr[yprev], eax       
            ;-----------------------
            add esi, sizeof TAIL
            inc ebx
            
        @@For:
            cmp ebx, nTail
            jb @@In
            
        .endif
        
        ;---------------------------
        fn gotoxy, snake.x, snake.y
        fn crt_putchar, 20h
        ;---------------------------
    
        .if snake.direction == 'w'
            
            mov eax, dword ptr[y]
            dec eax
            ;------------------------
            fn CheckCursorPosition, x, eax
            ;------------------------
            .if al == 20h || al == fruit.sprite
            
                dec dword ptr[snake.y]
                
            .elseif al == '#'
                
                mov byte ptr[snake.direction], STOP
            
            .endif
         
        .elseif snake.direction == 's'
        
            mov eax, dword ptr[y]
            inc eax
            ;------------------------
            fn CheckCursorPosition, x, eax
            ;------------------------
            .if al == 20h || al == fruit.sprite
            
                inc dword ptr[snake.y]
                
            .elseif al == '#'
                
                mov byte ptr[snake.direction], STOP
            
            .endif
        
        .elseif snake.direction == 'a'
        
            mov eax, dword ptr[x]
            dec eax
            ;------------------------
            fn CheckCursorPosition, eax, y
            ;------------------------
            .if al == 20h || al == fruit.sprite
            
                dec dword ptr[snake.x]
                
            .elseif al == '#'
                
                mov byte ptr[snake.direction], STOP
            
            .endif
        
        .elseif snake.direction == 'd'
            
            mov eax, dword ptr[x]
            inc eax
            ;------------------------
            fn CheckCursorPosition, eax, y
            ;------------------------
            .if al == 20h || al == fruit.sprite
            
                inc dword ptr[snake.x]
                
            .elseif al == '#'
                
                mov byte ptr[snake.direction], STOP
            
            .endif
        
        .endif
        mov spd_count, 0
    .endif

    ;------------------ Catch a fruit check ----------
    
    mov eax, snake.x
    mov ebx, snake.y
    
    .if eax == fruit.x && ebx == fruit.y
        .if nTail < MAX_TAIL
            
            inc nTail
            inc nPickup
            ;--------------------------------
            fn CreateFruit, 
            ;--------------------------------
            add score, 10
            ;--------------------------------                  
                
            ;fn Play_sound, offset szFruit
        .endif
        
    
    .endif    

	Ret
GameUpdate endp
;***********************************



KeyEvent proc uses ebx esi edi

    ;mov byte ptr[bKey], 31h 
    ;--------------------------
    fn Keyboard_check
    ;--------------------------
    mov byte ptr[bKey], al
    ;--------------------------
    .if byte ptr[bKey] == KEY_ESC
    
        fn mfmPause
        mov byte ptr[gameOver], 0
        mov byte ptr[closeConsole], 1
    
    .elseif byte ptr[bKey] == 'p'
    
        fn GamePause, 37, 18
    
    .elseif byte ptr[bKey] == 'w' || byte ptr[bKey] == 's' || byte ptr[bKey] == 'a' || byte ptr[bKey] == 'd'  
    
        mov byte ptr[snake.direction], al
    
    .endif

	Ret
KeyEvent endp
;*************************************

StepEvent proc uses ebx esi edi
    
    .if nPickup == SPD_STEP
        
        mov nPickup, 0
        ;------------------------
        dec snake.speed
        ;------------------------
        
        .if snake.speed <= 0
        
            mov snake.speed, MAX_SPEED
        
        .endif
        
    .endif
    
    .if snake.direction == STOP
        @@GameOver: 
            fn GameOverMenu
            jmp @@Ret    
    .endif
    
    ;------------------ Catch a tail check -----------
    
    .if nTail > 0
        
        lea esi, tail
        xor ebx, ebx
        jmp @@For2
        
        @@In2:
            mov eax, dword ptr[esi]
            mov edx, dword ptr[esi+4]
            .if eax == snake.x && edx == snake.y
            
                jmp @@GameOver
            
            .endif
            inc ebx
            add esi, sizeof TAIL
        @@For2:
        
            cmp ebx, nTail
            jb @@In2
        
    .endif
    
@@Ret:
    fn Sleep, MAX_STEP
	Ret
StepEvent endp

DrawEvent proc uses ebx esi edi


    .if nTail > 0
    
        fn DrawTail
    
    .endif 
    ;-------------------------------
    fn DrawSnake, snake.x, snake.y
    ;-------------------------------
    fn DrawFruit
    ;-------------------------------
    fn ShowScore
    ;-------------------------------
    
	Ret
DrawEvent endp
;*************************************

ShowScore proc uses ebx esi edi

    mov ebx, score
    
    .if ebx > score_old
    
        fn DrawScore, 8, 40, LightGreen, ebx 
        ;----------------------------
        mov dword ptr[score_old], ebx
        
    .endif

	Ret
ShowScore endp
;*************************************

DrawPanel proc uses ebx esi edi
    
    fn SetConsoleColor, cPanel
    ;---------------------------
    fn gotoxy, 21,40
    ;---------------------------
    fn crt_printf, "Esc - back to menu, P - pause the game"
    ;---------------------------
    

	Ret
DrawPanel endp
;************************************

GameOverMenu proc uses ebx esi edi
    
    mov byte ptr[gameOver], 0
    ;-------------------------------
    fn mfmPause
    ;-------------------------------
    fn crt_system, offset szCls
    ;-------------------------------
    fn SetConsoleColor, cBrown
    ;-------------------------------
    xor ebx, ebx
    inc ebx
    mov edi, 41
    ;-------------------------------

@@Do:

    fn SetConsoleColor, cBrown
    fn gotoxy, 35, ebx
    ;-------------------------------
    fn crt_puts, offset szGameOver
    ;-------------------------------
    dec ebx
    fn gotoxy, 35, ebx
    ;-------------------------------
    fn crt_puts, "         "
    
    inc ebx
    ;-------------------------------
    fn SetConsoleColor, cWhite
    fn gotoxy, 24, edi
    fn crt_puts, offset szBack
    ;------------------------------
    inc edi
    fn gotoxy, 24, edi
    fn crt_puts, "                                "
    dec edi
    ;-------------------------------
    fn Sleep, 400
    dec edi
    inc ebx
    cmp ebx, 19 
    jne @@Do
    
@@L0:

    fn Keyboard_check_pressed
    cmp al, KEY_ENTER
    jne @@L0
    

	Ret
GameOverMenu endp