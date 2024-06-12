      .686P
      .mmx
      .xmm                                      ; create 32 bit code
      .model flat, stdcall                      ; 32 bit memory model
      option casemap :none                      ; case sensitive 

;     include files
;     ~~~~~~~~~~~~~
      include \masm32\include\windows.inc       ; main windows include file
      include \masm32\include\masm32.inc        ; masm32 library include

    ; -------------------------
    ; Windows API include files
    ; -------------------------
      include \masm32\include\gdi32.inc
      include \masm32\include\user32.inc
      include \masm32\include\kernel32.inc
      include \masm32\include\Comctl32.inc
      include \masm32\include\comdlg32.inc
      include \masm32\include\shell32.inc
      include \masm32\include\oleaut32.inc
      include \masm32\include\ole32.inc
      include \masm32\include\msvcrt.inc
      include \masm32\include\fpu.inc
      include minifmod\mfmplayer.inc  
        
      include \masm32\macros\macros.asm         ; masm32 macro file

;     libraries
;     ~~~~~~~~~
      includelib \masm32\lib\masm32.lib         ; masm32 static library

    ; ------------------------------------------
    ; import libraries for Windows API functions
    ; ------------------------------------------
      includelib \masm32\include\fpu.lib
      includelib \masm32\lib\gdi32.lib
      includelib \masm32\lib\user32.lib
      includelib \masm32\lib\kernel32.lib
      includelib \masm32\lib\Comctl32.lib
      includelib \masm32\lib\comdlg32.lib
      includelib \masm32\lib\shell32.lib
      includelib \masm32\lib\oleaut32.lib
      includelib \masm32\lib\ole32.lib
      includelib \masm32\lib\msvcrt.lib