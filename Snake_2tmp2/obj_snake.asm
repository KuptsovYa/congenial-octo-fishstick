

DrawSnake       proto :DWORD, :DWORD
DrawTail        proto
ClearTail       proto
CreateSnake     proto

SNAKE struct

    x           dword ?
    y           dword ? 
    direction   db ?
                db ?
    speed       dword ?            
    

SNAKE ends
;--------------------------------
TAIL struct

    x   dword ?
    y   dword ?
    

TAIL ends

.const
    MAX_SPEED   equ 10
    SPD_STEP    equ 10
    MAX_TAIL    equ 500

.data?
    snake       SNAKE <>
    tail        TAIL MAX_TAIL dup(<>)
    spd_count   dd ?
    nTail       dd ?
    nPickup     dd ?
    
.code
CreateSnake proc uses ebx esi edi

    mov dword ptr[snake.x], 40
    mov dword ptr[snake.y], 20
    mov byte ptr[snake.direction], 31h   
    mov dword ptr[snake.speed], MAX_SPEED
    mov dword ptr[spd_count], 0
    ;---------------------------
    mov dword ptr[score], 0
    mov dword ptr[score_old], 0
    ;---------------------------
    fn ClearTail
    ;---------------------------
    mov dword ptr[nTail], 0
    mov dword ptr[nPickup], 0
    
	Ret
CreateSnake endp

;********************************
DrawSnake proc uses ebx esi edi x:DWORD, y:DWORD

    fn gotoxy, x, y
    ;-------------------------
    fn SetConsoleColor, LightCyan
    ;-------------------------
    fn crt_putchar, '0'
    
	Ret
DrawSnake endp
;*************************************
DrawTail proc uses ebx esi edi
    
    fn SetConsoleColor, LightCyan
    ;------------------------------
    lea esi, tail
    xor ebx, ebx
    jmp @@For

@@In:
    
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esi+4]
    ;------------------------------
    .if eax == 0 || eax == 0
        jmp @@Ret
    .endif
    ;------------------------------
    fn gotoxy, eax, edx
    ;------------------------------
    fn crt_putchar, 'o'
    ;------------------------------
    inc ebx
    add esi, sizeof TAIL
    
@@For:
    cmp ebx, nTail
    jb @@In

@@Ret:
	Ret
DrawTail endp

;*************************************
ClearTail proc uses ebx esi edi

    lea esi, tail
    ;------------------------------
    xor ebx, ebx
    ;------------------------------
    jmp @@For
   
@@In:
    mov dword ptr[esi], 0
    mov dword ptr[esi+4], 0
    
    add esi, sizeof TAIL
    inc ebx
@@For:
    cmp ebx, nTail
    jb @@In   
  
	Ret
ClearTail endp