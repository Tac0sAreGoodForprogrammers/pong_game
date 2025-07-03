bootloader.img: bootloader.asm snake_logic.asm
	nasm -f bin bootloader.asm -o bootloader.img

clean:
	rm -f bootloader.img