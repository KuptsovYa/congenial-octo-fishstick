include congame.inc

includelib congame.lib

include xm.asm

Main                    proto


.const
    MAX_WIDTH          equ 82
    MAX_HEIGHT         equ 42




.data?




.data
srect                  SMALL_RECT <0,0,81,41>
szClick                db "Res\Click.wav",0
szFruit                db "Res\Treasure.wav",0
szCls                  db "cls",0

