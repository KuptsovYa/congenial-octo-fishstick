include \masm32\congamelib\congame.inc
includelib \masm32\congamelib\congame.lib

Main        proto
Generate    proto :DWORD
InitApp     proto
;----------------------------------


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

;********************************************
pChar     dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h       
          dw  20h,07h,20h,07h,20h,07h,20h,07h   
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h   
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h   
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h   
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h 
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,5Bh,38h,78h,38h   
          dw  5Dh,38h,20h,07h,20h,07h,20h,07h   
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h  
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2554h,30h,2550h,30h,2550h,30h   
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h 
          dw  2550h,30h,2550h,30h,2550h,30h,4bh,30h     
          dw  65h,30h,79h,30h,67h,30h,65h,30h        
          dw  6eh,30h,20h,30h,57h,30h,61h,30h    
          dw  76h,30h,65h,30h,50h,30h,61h,30h        
          dw  64h,30h,20h,30h,53h,30h,6fh,30h       
          dw  75h,30h,6eh,30h,64h,30h,20h,30h         
          dw  45h,30h,64h,30h,69h,30h,74h,30h        
          dw  6fh,30h,72h,30h,20h,30h,76h,30h         
          dw  31h,30h,2eh,30h,37h,30h,20h,30h            
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2557h,30h,20h,30h     
          dw  20h,30h,20h,07h,20h,07h,20h,07h           
          dw  20h,07h,20h,07h,20h,07h,20h,07h         
          dw  20h,07h,20h,07h,20h,07h,20h,07h   
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h            
          dw  20h,30h,2551h,30h,20h,30h,20h,30h           
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h   
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h   
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h           
          dw  20h,30h,20h,07h,20h,07h,20h,07h              
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h    
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h           
          dw  20h,30h,2551h,30h,20h,30h,20h,30h             
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h    
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h    
          ;---------------------------------
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,2eh,20h,2eh,2554h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2557h,2eh
          dw  20h,2eh,20h,2eh,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,2eh,20h,2eh,2551h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,50h,2eh,72h,2eh   ; Press check button
          dw  65h,2eh,73h,2eh,73h,2eh,20h,2eh
          dw  63h,2eh,68h,2eh,65h,2eh,63h,2eh
          dw  6bh,2eh,20h,2eh,62h,2eh,75h,2eh
          dw  74h,2eh,74h,2eh,6fh,2eh,6eh,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,2551h,2eh
          dw  20h,2eh,20h,2eh,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,2eh,20h,2eh,255ah,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,2550h,2eh
          dw  2550h,2eh,2550h,2eh,2550h,2eh,255dh,2eh
          dw  20h,2eh,20h,2eh,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,2eh,20h,2eh
          dw  20h,2eh,20h,2eh,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,2551h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,2551h,30h,20h,30h         
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,255Ah,30h,2550h,30h,2550h,30h      
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2Ah,30h      
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,2550h,30h,2550h,30h
          dw  2550h,30h,2550h,30h,255Dh,30h,20h,30h     
          dw  20h,30h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,30h,20h,30h,20h,30h
          dw  20h,30h,20h,07h,20h,07h,20h,07h               
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,07h
          dw  20h,07h,20h,07h,20h,07h,20h,0h
          ;----------------------------------------
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h
bGen      dw  20h,07h,20h,37h,63h,37h,68h,37h  ;   Button Generate
          dw  65h,37h,63h,37h,6bh,37h,20h,37h
          ;----------------------------------------
          dw  20h,07h,20h,70h,20h,70h,20h,70h  
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h  
          dw  20h,70h,20h,70h,20h,70h,20h,70h 
          dw  20h,70h,20h,70h,20h,70h,20h,70h  
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          ;--------------------------------------
          dw  20h,70h,20h,70h,20h,70h,20h,70h   
          dw  20h,70h,20h,70h,20h,70h,20h,70h
bCopy     dw  20h,07h,20h,37h,63h,37h,6fh,37h  ;Button Copy 
          dw  70h,37h,79h,37h,20h,37h,20h,37h
          dw  20h,07h,20h,70h,20h,70h,20h,70h   
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          dw  20h,70h,20h,70h,20h,70h,20h,70h 
          dw  20h,70h,20h,70h,20h,70h,20h,70h
          
          ;-----------------------------------
bGenDown  dw  20h,2eh,63h,2eh,68h,2eh  
          dw  65h,2eh,63h,2eh,6bh,2eh
          dw  20h,2eh
          ;-----------------------------------
bCopyDown dw  20h,2eh,63h,2eh,6fh,2eh  
          dw  70h,2eh,79h,2eh,20h,2eh
          dw  20h,2eh
;---------------------------------------------