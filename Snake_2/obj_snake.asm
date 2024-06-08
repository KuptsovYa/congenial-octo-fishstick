

DrawSnake       proto :DWORD, :DWORD
DrawTail        proto
ClearTail       proto

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
    MAX_TAIL    equ 500

.data?
    snake       SNAKE <>
    tail        TAIL MAX_TAIL dup(<>)
    spd_count   dd ?
    nTail       dd ?
    
.code

DrawSnake proc uses ebx esi edi x:DWORD, y:DWORD

    fn gotoxy, x, y
    ;-------------------------
    fn SetColor, LightCyan
    ;-------------------------
    fn crt_putchar, '0'
    
	Ret
DrawSnake endp
;*************************************
DrawTail proc uses ebx esi edi

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