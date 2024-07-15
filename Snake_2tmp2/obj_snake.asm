

DrawSnake       proto
DrawTail        proto
ClearTail       proto
CreateSnake     proto



.const
    MAX_SPEED   equ 10
    SPD_STEP    equ 10
    MAX_TAIL    equ 500

.data?
    snake       GAME_OBJECT <>
    tail        OBJECT MAX_TAIL dup(<>)
    spd_count   dd ?
    nTail       dd ?
    nPickup     dd ?
    
.code
CreateSnake proc uses ebx esi edi
    
    fn CreateObject, offset snake, 40, 20, MAX_SPEED, 0, 0, 0, 31h, 0, 0, 'O'

    fn ClearTail
    ;---------------------------
    mov dword ptr[nTail], 0
    mov dword ptr[nPickup], 0
    
	Ret
CreateSnake endp

;********************************
DrawSnake proc uses ebx esi edi

    fn gotoxy, snake.obj.x, snake.obj.y
    ;-------------------------
    fn SetConsoleColor, 0, LightCyan
    ;-------------------------
    movzx eax, byte ptr[snake.sprite]
    fn crt_putchar, eax
    
	Ret
DrawSnake endp
;*************************************
DrawTail proc uses ebx esi edi
    
    fn SetConsoleColor, 0, LightCyan
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
    add esi, sizeof OBJECT
    
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
    mov dword ptr[esi+8], 0
    mov dword ptr[esi+12], 0
    add esi, sizeof OBJECT
    inc ebx
@@For:
    cmp ebx, nTail
    jb @@In   
  
	Ret
ClearTail endp