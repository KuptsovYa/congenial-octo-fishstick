include \masm32\congamelib\congame.inc
includelib \masm32\congamelin\congame.lib

Main        proto
Generate    proto :DWORD




.data
szAlpha     db "abcdef", 0
szStr1      db "mnbvaq", 0
szStr2      db "cxzlbr", 0
szStr3      db "kjhgct", 0
szStr4      db "fdsady", 0
szStr5      db "poiueu", 0
szStr6      db "ytrefo", 0
szStr7      db "wqalgx", 0
szStr8      db "ksjdhv", 0
szStr9      db "hfgbif", 0
szStr10     db "qazwja", 0
szStr11     db "sxedkf", 0
szStr12     db "crfvlg", 0
szStr13     db "tgbymh", 0
szStr14     db "hnujni", 0
szStr15     db "miklop", 0
szStr16     db "plokpc", 0
;-------------------------
table   dd offset szStr1
        dd offset szStr2
        dd offset szStr3
        dd offset szStr4
        dd offset szStr5
        dd offset szStr6
        dd offset szStr7
        dd offset szStr8
        dd offset szStr9
        dd offset szStr10
        dd offset szStr11
        dd offset szStr12
        dd offset szStr13
        dd offset szStr14
        dd offset szStr15
        dd offset szStr16
        
sn      dd 29E07Ch

buffer  db 16 dup (0)

.code
start:

    fn Main
    ;-----------------
    inkey
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