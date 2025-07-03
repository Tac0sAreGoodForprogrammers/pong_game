; snake_logic.asm

snake_main:
    ; for now, just display a placeholder character in a loop
    mov si, snake_msg

snake_loop:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp snake_loop

.done:
    ret

snake_msg db "Snake logic not yet implemented!", 0