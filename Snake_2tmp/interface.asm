
MainMenu        proto
GameOverMenu    proto
AboutMenu       proto 

.data
szAbout db "about.txt",0

.code

MainMenu proc uses ebx esi edi
       LOCAL hOut:DWORD
       LOCAL choice:DWORD
       LOCAL cStart:DWORD
       LOCAL cExit:DWORD
       LOCAL cAbout:DWORD 
       
       fn crt_system,offset szCls
       ;-------------------------
       mov hOut,rv(GetStdHandle,-11)
       ;--------------------------
       mov dword ptr[choice],1
       ;---------------------------
       mov cStart, cWhite
       ;---------------------------
       mov cExit, cBrown
       ;---------------------------
       mov cAbout, cBrown
       ;---------------------------
       mov byte ptr[bKey],31h
       ;---------------------------     
       mov byte ptr[closeConsole],0
       ;---------------------------
		.while  closeConsole == 0 && gameOver == 0   

			.while byte ptr[bKey] != KEY_ENTER
			
			     
               mov byte ptr[bKey], 31h
               fn SetConsoleTextAttribute,hOut,cStart
               ;-------------------------------------
               fn gotoxy,37,18
               fn crt_printf,"START"
               ;-------------------------------------
               fn SetConsoleTextAttribute,hOut,cExit
               ;-------------------------------------
               fn gotoxy,37,20
               fn crt_printf,"EXIT"
               ;-------------------------------------
               fn SetConsoleTextAttribute,hOut,cAbout
               ;-------------------------------------
               fn gotoxy,37,22
               fn crt_printf,"ABOUT"
               ;-------------------------------------
               fn Keyboard_check_pressed
               mov byte ptr[bKey], al
               ;-------------------------------------
               
               .if al == 'w' && choice == 2
               
                   dec dword ptr[choice]
                   ;-------------------------------
                   mov dword ptr[cExit],cBrown
                   mov dword ptr[cStart],cWhite
                   mov dword ptr[cAbout],cBrown
                   ;-------------------------------
                   fn Play_sound,offset szClick
                   
               .elseif al == 'w' && choice == 3
               
                   dec dword ptr[choice]
                   ;-------------------------------
                   mov dword ptr[cExit],cWhite
                   mov dword ptr[cStart],cBrown
                   mov dword ptr[cAbout],cBrown
                   ;-------------------------------
                   fn Play_sound,offset szClick
               
               .elseif al == 's' && choice == 1
               
                   inc dword ptr[choice]
                   ;-------------------------------
                   mov dword ptr[cExit],cWhite
                   mov dword ptr[cStart],cBrown
                   mov dword ptr[cAbout],cBrown
                   ;-------------------------------
                   fn Play_sound,offset szClick
                   
              .elseif al == 's' && choice == 2
                
                   inc dword ptr[choice]
                   ;-------------------------------
                   mov dword ptr[cExit],cBrown
                   mov dword ptr[cStart],cBrown
                   mov dword ptr[cAbout],cWhite
                   ;-------------------------------
                   fn Play_sound,offset szClick  
                  
              
              .endif
          .endw
          
       .if choice == 1
          
          mov gameOver,1
          
      .elseif choice == 2
          
          mov closeConsole,1
          
      .elseif choice == 3
      
            fn AboutMenu
          
      .endif
      ;--------------------------------------------------- 
      fn crt_system,offset szCls
      ;---------------------------------------------------
      mov byte ptr[bKey],31h
      .endw
      
	ret
MainMenu endp

;**************************************
AboutMenu proc uses ebx esi edi
    LOCAL hFile:DWORD
    LOCAL buffer[256]:BYTE 
    LOCAL bStart:DWORD
    
    mov bStart,0
    
       fn crt_system,offset szCls
       ;--------------------------------
       fn crt_fopen,offset szAbout,"r"
       ;--------------------------------
       or eax,eax
       je @@Ret
       ;--------------------------------
       mov dword ptr[hFile],eax
       ;--------------------------------
       push eax
       ;--------------------------------
       fn SetConsoleColor, cYellow
       ;--------------------------------
       lea ebx,buffer
@@While:
       
       fn crt_fgets,ebx,256,hFile
       ;--------------------------------
       or eax,eax
       ;--------------------------------
       je @@CloseFile
       ;--------------------------------
       fn crt_printf,eax
       ;--------------------------------
       inc bStart
       ;--------------------------------
       .if bStart == 9
       
          fn SetConsoleColor,LightRed
          
       .endif
       jmp @@While
       ;--------------------------------
@@CloseFile:
      pop eax
      ;---------------------------------
      fn crt_fclose,eax
      ;---------------------------------
      fn Keyboard_check_pressed
      ;---------------------------------
      fn Play_sound,offset szClick
  
@@Ret:
	ret
AboutMenu endp
