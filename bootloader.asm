; bootloader.asm — Real mode x86 Hello World
; Assemble with: nasm -f bin bootloader.asm -o bootloader.img
; Run with: qemu-system-i386 -drive format=raw,file=bootloader.img

org 0x7c00            ; BIOS loads us here

start:
    ; Set video mode 0x03 (80x25 text mode)
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; Print string pointed by SI
    mov si, message

print_loop:
    lodsb               ; Load byte at SI into AL and advance SI
    or al, al           ; Check if it's null terminator
    jz hang             ; If yes, jump to hang

    mov ah, 0x0E        ; BIOS teletype output function
    mov bh, 0x00        ; Page number
    mov bl, 0x07        ; Text attribute (light gray on black)
    int 0x10            ; Print character in AL

    jmp print_loop

hang:
    cli                 ; Clear interrupts
    hlt                 ; Halt CPU
    jmp hang            ; Just in case HLT is ignored

message db "Hello, World!", 0    ; Null-terminated message

times 510 - ($ - $$) db 0        ; Pad to 510 bytes
dw 0xAA55                        ; Boot signature