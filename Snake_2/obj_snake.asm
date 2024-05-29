




SNAKE struct

    x           dword ?
    y           dword ? 
    direction   db ?
                db ?
    speed       dword ?            
    

SNAKE ends
;--------------------------------


.const

    MAX_SPEED   equ 10

.data?
    snake       SNAKE <>