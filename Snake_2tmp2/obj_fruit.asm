
CreateFruit     proto
DrawFruit       proto

;--------------------------
TIME_BLINK  equ 10
;--------------------------
.data?

    fruit   GAME_OBJECT <>
    blink   dd ?


.code

DrawFruit  proc uses ebx esi edi

    inc blink 
    ;---------------------------
    .if blink >= TIME_BLINK
        
        .if byte ptr[fruit.sprite] == 1
        
            mov byte ptr[fruit.sprite], 2
        .else
        
            mov byte ptr[fruit.sprite], 1
        
        .endif
        
        mov blink, 0
        
    .endif
    fn gotoxy, fruit.obj.x, fruit.obj.y
    fn SetConsoleColor, 0,LightRed
    movzx eax, fruit.sprite
    putchar eax
    ;---------------------------
    
	Ret
DrawFruit endp


CreateFruit proc uses ebx esi edi

    LOCAL x:DWORD
    LOCAL y:DWORD
    
@@Do:
    fn RangedRand, 1, 80
    mov dword ptr[x], eax
    ;------------------------------
    fn RangedRand, 1, 35
    mov dword ptr[y], eax
    ;------------------------------
    fn CheckCursorPosition, x, y
    cmp al, 20h
    je @F
    jmp @@Do
    ;------------------------------
    
@@:

    mov ebx, dword ptr[x]
    mov edx, dword ptr[y]
    
    fn CreateObject, offset fruit, ebx, edx, 0, 0, 0, 0, 0, 0, 0, 1
    ;----------------------------------------------------------------
    mov blink, 0

	Ret
CreateFruit endp