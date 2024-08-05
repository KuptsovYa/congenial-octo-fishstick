.686P
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
;---------------------------------
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
;---------------------------------
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
;---------------------------------
include \masm32\macros\macros.asm
;*********************************

WinMain         proto :DWORD, :DWORD, :DWORD, :DWORD
WindowProc      proto :DWORD, :DWORD, :DWORD, :DWORD
;*********************************

WINDOW_WIDTH    =   256
WINDOW_HEIGHT   =   256

.data?

hInstance       dd ?
hWnd            dd ?


.data

szClassName     db   "Win32Class",0
szTitle         db   "Win32 demo",0