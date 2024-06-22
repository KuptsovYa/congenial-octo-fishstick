include main.inc
;----------------------
include obj_fruit.asm
include obj_snake.asm
include engine.asm
include interface.asm

.code
start:
     fn SetConsoleTitle,"Snake demo"
     ;-----------------
     fn SetConsoleWindowSize,MAX_WIDTH,MAX_HEIGHT
     ;-----------------
     fn HideConsoleCursor
     ;-----------------
     fn Main
     ;-----------------    
     exit
;******************************************
Main proc 

     fn MainMenu
     ;-----------------------
     .while closeConsole == 0
        ;------------------------------------
        fn GameInit
        ;------------------------------------
           .while gameOver == 1
            
            fn GameUpdate
            fn GameController

          .endw
       ;---------------------
       fn MainMenu
    .endw
    ;------------------------
    fn gotoxy,25,40
	ret
Main endp
;*******************************************

end start
