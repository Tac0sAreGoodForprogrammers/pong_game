; snake_logic.asm
org 0x8000

snake_main:
    mov si, welcome_msg

print_welcome:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print_welcome

done:
    cli
    hlt
    jmp $

welcome_msg db "Welcome to Snake Stage 2!", 0
