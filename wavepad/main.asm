include main.inc


.code
start:


    fn SetConsoleTitle, "WavePad Sound Editor"
    ;----------------------------------------
    fn SetConsoleWindowSize, 80, 25
    ;----------------------------------------
    fn HideConsoleCursor
    ;----------------------------------------
    fn initApp
    ;----------------------------------------
    ;fn Main
    ;-----------------
    getkey
    
    exit
    
Main proc
    
    LOCAL result0:DWORD
    LOCAL result1:DWORD
    LOCAL result2:DWORD
    
    fn szCopy, offset szAlpha, offset buffer
    ;----------------------
    mov eax, dword ptr[sn]
    ;xor edx, edx
    ;mov ecx, 100
    ;div ecx
    mov dword ptr[result0], eax
    ;----------------------
    mov ecx, 9
    xor edx, edx
    div ecx
    mov dword ptr[result1], eax
    ;----------------------
    
    lea esi, table
    lea esi, dword ptr[esi+edx*4]
    mov esi, dword ptr[esi]
    ;----------------------
    mov ebx, 1Ah
    mov edi, 61h
    fn Generate, esi
    ;---------------------
    mov eax, dword ptr [result1]
    mov ecx, 7
    xor edx, edx
    div ecx
    ;---------------------
    lea esi, table
    lea esi, dword ptr[esi+edx*4+24h]
    mov esi, dword ptr[esi]
    
    fn Generate, esi
    
    
    ;---------------------
    mov eax, dword ptr[result0]
    xor edx, edx
    mov ecx, 3Fh
    div ecx
    mov dword ptr[result0], eax
    ;---------------------
    xor edx, edx
    mov ecx, 9
    div ecx
    mov dword ptr[result1], eax
    ;---------------------
    lea esi, table
    lea esi, dword ptr[esi+edx*4]
    mov esi, dword ptr[esi]
    fn Generate, esi
    ;---------------------
    mov eax, dword ptr[result1]
    mov ecx, 7
    xor edx, edx
    div ecx
    ;---------------------
    lea esi, table
    lea esi, dword ptr[esi+edx*4+24h]
    mov esi, dword ptr[esi]
    fn Generate, esi
    ;---------------------
    mov eax, dword ptr[result0]
    xor edx, edx
    mov ecx, 3Fh
    div ecx
    mov dword ptr[result0], eax
    xor edx, edx
    mov ecx, 9h
    div ecx
    mov dword ptr[result1], eax
    
    lea esi, table
    lea esi, dword ptr[esi+edx*4]
    mov esi, dword ptr[esi]
    fn Generate, esi
    ;---------------------
    mov eax, dword ptr[result1]
    xor edx, edx
    mov ecx, 7h
    div ecx
    
    lea esi, table
    lea esi, dword ptr[esi+edx*4+24h]
    mov esi, dword ptr[esi]
    fn Generate, esi
    ;------------------------
    mov eax, dword ptr[result0]
    xor edx, edx
    mov ecx, 3Fh
    div ecx
    xor edx, edx
    mov ecx, 9h
    div ecx
    mov dword ptr[result0], eax 
    
    lea esi, table
    lea esi, dword ptr[esi+edx*4]
    mov esi, dword ptr[esi]
    fn Generate, esi
    ;------------------------
    mov eax, dword ptr[result0]
    xor edx, edx
    mov ecx, 7h
    div ecx
    
    lea esi, table
    lea esi, dword ptr[esi+edx*4+24h]
    mov esi, dword ptr[esi]
    fn Generate, esi
    ;-----------------------
    fn Generate, offset szStr8
    ;-----------------------
    fn Generate, offset szStr11
    ;-----------------------
    fn Generate, offset szStr1
    ;-----------------------
    fn Generate, offset szStr10
    
    mov byte ptr[buffer+6], 'c'
    mov byte ptr[buffer+7], 'l' 
    mov byte ptr[buffer+8], 0 
    mov eax, sn
    
    
    printf("%d-%s\n\n", eax, offset buffer)
    ;lea esi, dword ptr[buffer]
    ;print esi

    putchar 10
    

	Ret
Main endp
;******************************************
InitApp proc uses ebx esi edi

    




	Ret
InitApp endp



;******************************************
Generate proc uses ebx esi edi lpStr:DWORD

    mov esi, lpStr
    ;--------------------
    movzx edx, byte ptr[esi]
    movzx eax, byte ptr[buffer]
    lea eax, dword ptr[eax+edx-0C2h]  
    cdq
    idiv ebx
    ;--------------------
    add edx, edi
    mov byte ptr[buffer], dl
;=================================================    
    movzx edx, byte ptr[esi + 1]
    movzx eax, byte ptr[buffer + 1]
    lea eax, dword ptr[eax+edx-0C2h]  
    cdq
    idiv ebx
    ;--------------------
    add edx, edi
    mov byte ptr[buffer + 1], dl
;=================================================
    movzx edx, byte ptr[esi + 2]
    movzx eax, byte ptr[buffer + 2]
    lea eax, dword ptr[eax+edx-0C2h]  
    cdq
    idiv ebx
    ;--------------------
    add edx, edi
    mov byte ptr[buffer + 2], dl
;=================================================
    movzx edx, byte ptr[esi + 3]
    movzx eax, byte ptr[buffer + 3]
    lea eax, dword ptr[eax+edx-0C2h]  
    cdq
    idiv ebx
    ;--------------------
    add edx, edi
    mov byte ptr[buffer + 3], dl
;=================================================    
    movzx edx, byte ptr[esi + 4]
    movzx eax, byte ptr[buffer + 4]
    lea eax, dword ptr[eax+edx-0C2h]  
    cdq
    idiv ebx
    ;--------------------
    add edx, edi
    mov byte ptr[buffer + 4], dl
;=================================================    
    movzx edx, byte ptr[esi + 5]
    movzx eax, byte ptr[buffer + 5]
    lea eax, dword ptr[eax+edx-0C2h]  
    cdq
    idiv ebx
    ;--------------------
    add edx, edi
    mov byte ptr[buffer + 5], dl
;=================================================
    
    ret
Generate endp

end start