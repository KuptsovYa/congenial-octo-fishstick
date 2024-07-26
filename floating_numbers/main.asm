include \masm32\congamelib\congame.inc
includelib \masm32\congamelib\congame.lib

main proto
;-----------------------------

float   TYPEDEF REAL4
double  TYPEDEF REAL8
long_double TYPEDEF REAL10

.data 
ashort      float   431BA000r     ;ieee754
bdouble     double   2.523E1   
cten        long_double  2523.0E-2

result      long_double  0.0


buffer      db 64 dup (0)

.code

start:

    fn main
    ;------------------
    inkey
    ;------------------   
    exit
    ;------------------
   
main proc
    
    fld ashort
    fstp result
    ;-----------------------------
    fn FpuFLtoA, offset cten, 3, offset buffer, SRC1_REAL or SRC2_DIMM
    ;-----------------------------
    print offset buffer
    ;-----------------------------
    putchar 10

	Ret
main endp

end start