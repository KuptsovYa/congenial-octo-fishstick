include \masm32\congamelib\congame.inc
includelib \masm32\congamelib\congame.lib

Main        proto
Generate    proto :DWORD
InitApp     proto


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