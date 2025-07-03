org 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    ; Set video mode
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; Print message
    mov si, msg_start
print_loop:
    lodsb
    or al, al
    jz load_second_stage
    mov ah, 0x0E
    int 0x10
    jmp print_loop

load_second_stage:
    ; BIOS INT 13h to load 1 sector at LBA 2 into 0x8000
    mov ah, 0x02            ; function: read sectors
    mov al, 0x01            ; # of sectors
    mov ch, 0x00            ; cylinder
    mov cl, 0x02            ; sector 2
    mov dh, 0x00            ; head
    mov dl, 0x80            ; drive (floppy, or adjust for HDD if needed)
    mov bx, 0x8000          ; ES:BX target address
    mov es, bx
    xor bx, bx              ; offset in segment
    int 0x13
    jc disk_error           ; carry set = fail

    jmp 0x8000              ; jump to loaded code

disk_error:
    mov si, err_msg
err_loop:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0E
    int 0x10
    jmp err_loop

halt:
    cli
    hlt
    jmp halt

msg_start db "Loading Snake...", 0
err_msg   db "Disk read error!", 0

; Pad to 510 bytes
times 510 - ($ - $$) db 0
dw 0xAA55
