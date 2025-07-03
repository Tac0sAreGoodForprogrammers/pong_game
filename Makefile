BUILD_DIR = build
STAGE1    = $(BUILD_DIR)/bootloader_stage1.bin
STAGE2    = $(BUILD_DIR)/snake_stage2.bin
IMG       = game.img

all: $(IMG)

$(STAGE1): bootloader.asm | $(BUILD_DIR)
	nasm -f bin bootloader.asm -o $(STAGE1)

$(STAGE2): snake_logic.asm | $(BUILD_DIR)
	nasm -f bin snake_logic.asm -o $(STAGE2)

$(IMG): $(STAGE1) $(STAGE2)
	cat $(STAGE1) $(STAGE2) > $(IMG)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

run: $(IMG)
	qemu-system-i386 -drive format=raw,file=$(IMG)

clean:
	rm -rf $(BUILD_DIR) $(IMG)

.PHONY: all clean run
