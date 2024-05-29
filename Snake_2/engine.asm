
Play_sound                  proto :DWORD
Keyboard_check_pressed      proto




.const
;-------------- Keys -----------------------

 KEY_ENTER     equ 13


.data
bKey          db 30h
gameOver      db 0
closeConsole  db 0




.code

Keyboard_check_pressed proc uses ebx esi edi

   fn FlushConsoleInputBuffer,rv(GetStdHandle,-10)
   ;-----------------------------------------
@@:
   fn Sleep,1
   fn crt__kbhit
   ;-------------
   or eax,eax
   je @B
   ;------------
   fn crt__getch
   ;------------
   mov byte ptr[bKey],al
   ret
Keyboard_check_pressed endp
;***********************************************************
Play_sound proc uses ebx esi edi lpFile:DWORD

     fn PlaySound,lpFile,0,SND_FILENAME or SND_ASYNC

	ret
Play_sound endp