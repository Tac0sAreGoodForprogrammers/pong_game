org 0x7C00
start:
    ; TODO: implement cursed serpentine logic
    cli
    hlt
    jmp $

times 510 - ($ - $$) db 0
dw 0xAA55