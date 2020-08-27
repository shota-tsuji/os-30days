SRC=helloos.asm
TARGET_DIR=bin
TARGET_IMG=$(TARGET_DIR)/helloos.img
TARGET_BIN=$(TARGET_DIR)/ipl.asm
QEMV=qemu-system-i386

all : img

run : img
	$(QEMV) -drive file=$(TARGET_IMG),format=raw,if=floppy

img : tail
	mkdir -p $(TARGET_DIR)
	#nasm $(SRC) -o $(TARGET_IMG)
	nasm $(SRC) -o $(TARGET_BIN)
	cat $(TARGET_BIN) tail.bin > $(TARGET_IMG)


tail : 
	nasm tail.asm -o tail.bin


clean :
	rm -rf $(TARGET_DIR)
