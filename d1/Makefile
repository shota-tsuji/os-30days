SRC=helloos.asm
TARGET_DIR=bin
TARGET_IMG=$(TARGET_DIR)/helloos.img
QEMV=qemu-system-i386

run : img
	$(QEMV) -drive file=$(TARGET_IMG),format=raw,if=floppy

img :
	mkdir -p $(TARGET_DIR)
	nasm $(SRC) -o $(TARGET_IMG)
