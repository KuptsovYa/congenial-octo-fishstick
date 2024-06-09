
MainMenu        proto
GameOverMenu        proto

.data


.code
MainMenu proc uses ebx esi edi
       LOCAL hOut:DWORD
       LOCAL choice:DWORD
       LOCAL cStart:DWORD
       LOCAL cExit:DWORD

       fn crt_system,offset szCls
       ;-------------------------
       mov hOut,rv(GetStdHandle,-11)
       ;--------------------------
       mov dword ptr[choice],1
       ;---------------------------
       mov cStart,cWhite
       ;---------------------------
       mov cExit,cBrown
       ;---------------------------
       mov byte ptr[bKey],30h
       ;---------------------------     
       mov byte ptr[closeConsole],0
       ;---------------------------
		.while  closeConsole == 0 && gameOver == 0   

			.while byte ptr[bKey] != KEY_ENTER
           
               fn SetConsoleTextAttribute,hOut,cStart
               ;-------------------------------------
               fn gotoxy,37,19
               fn crt_printf,"START"
               ;-------------------------------------
               fn SetConsoleTextAttribute,hOut,cExit
               ;-------------------------------------
               fn gotoxy,37,21
               fn crt_printf,"EXIT"
               ;-------------------------------------
               fn Keyboard_check_pressed
               ;-------------------------------------
               
               .if al == 'w' && choice == 2
               
                   dec dword ptr[choice]
                   ;-------------------------------
                   mov dword ptr[cExit],cBrown
                   mov dword ptr[cStart],cWhite
                   ;-------------------------------
                   fn Play_sound,offset szClick
               
               .elseif al == 's' && choice == 1
               
                   inc dword ptr[choice]
                   ;-------------------------------
                   mov dword ptr[cExit],cWhite
                   mov dword ptr[cStart],cBrown
                   ;-------------------------------
                   fn Play_sound,offset szClick
                   
              .endif
          .endw
          
       .if choice == 1
          
          mov gameOver,1
          
      .elseif choice == 2
          
          mov closeConsole,1
          
       .endif
      ;--------------------------------------------------- 
      fn crt_system,offset szCls
      ;---------------------------------------------------
      mov byte ptr[bKey],30h
      .endw
      
	ret
MainMenu endp

;**************************************
