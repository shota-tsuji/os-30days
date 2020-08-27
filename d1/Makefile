SRC=helloos.asm
TARGET_DIR=bin
TARGET_IMG=$(TARGET_DIR)/helloos.img
TARGET_BIN=$(TARGET_DIR)/ipl.bin
TAIL_BIN=$(TARGET_DIR)/tail.bin
QEMV=qemu-system-i386

all : img

run : img
	$(QEMV) -drive file=$(TARGET_IMG),format=raw,if=floppy

img : tail
	mkdir -p $(TARGET_DIR)
	nasm $(SRC) -o $(TARGET_BIN) -l $(TARGET_DIR)/$(SRC).lst
	cat $(TARGET_BIN) $(TAIL_BIN) > $(TARGET_IMG)


tail : 
	nasm tail.asm -o $(TAIL_BIN)


clean :
	rm -rf $(TARGET_DIR)/*.bin
	rm -rf $(TARGET_DIR)/*.img
	rm -rf $(TARGET_DIR)/*.lst
