include \masm32\include\masm32rt.inc
include \masm32\include\winmm.inc

includelib \masm32\lib\winmm.lib


Main                    proto
SetWindowSize           proto :DWORD,:DWORD
HideCursor              proto
SetColor                proto :DWORD
;------------------------------------------------
gotoxy                  proto :DWORD,:DWORD
;------------------------------------------------

        cBlack         = 0
        cBlue          = 1
        cGreen         = 2
        cCyan          = 3
        cRed           = 4
        cMagenta       = 5
        cBrown         = 6
        LightGray      = 7
        DarkGray       = 8
        LightBlue      = 9
        LightGreen     = 10
        LightCyan      = 11
        LightRed       = 12
        LightMagenta   = 13
        cYellow        = 14
        cWhite         = 15
        cPanel         = 48



.const
    MAX_WIDTH          equ 82
    MAX_HEIGHT         equ 42




.data?




.data
srect                  SMALL_RECT <0,0,81,41>
szClick                db "Res\Click.wav",0
szFruit                db "Res\Treasure.wav",0


