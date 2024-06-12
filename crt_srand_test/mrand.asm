include \masm32\include\masm32rt.inc
include \masm32\include\winmm.inc

RangedRand proto :DWORD, :DWORD


.data
    rand_max dq 32768.0
    
    

.code
start:
    
    fn crt_srand, rv(crt_time, 0)
    xor ebx, ebx
    jmp @@For
    ;-----------------------------
    
@@In:
    fn RangedRand, 1, 80
    ;-----------------------------
    
    print ustr$(eax)
    fn crt_putchar, 10
    
    inc ebx
    
@@For:
    cmp ebx, 10
    jb @@In
    
    inkey
    ;-----------------------------
    exit
    
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

	Ret
RangedRand endp

end start