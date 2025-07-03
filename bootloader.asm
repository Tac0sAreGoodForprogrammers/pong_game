; bootloader.asm
org 0x7C00

start:
    ; Set up segment registers
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00  ; stack grows down from here
    sti

    ; Set video mode 03h (text mode)
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; Display "Starting Snake..."
    mov si, msg_start
print_loop:
    lodsb
    or al, al
    jz after_print
    mov ah, 0x0E
    int 0x10
    jmp print_loop

after_print:
    call snake_main   ; jump to snake logic

hang:
    cli
    hlt
    jmp hang

msg_start db "Starting Snake...", 0

; include the game logic directly (for now)
%include "snake_logic.asm"

; pad to 510 bytes, then add boot signature
times 510 - ($ - $$) db 0
dw 0xAA55
