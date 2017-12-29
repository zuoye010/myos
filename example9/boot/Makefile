CC=gcc
LD=ld
LDFILE=boot.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: boot.bin

boot.bin: boot.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary boot.elf boot.bin

boot.elf: boot.o
	$(LD) boot.o -o boot.elf -e c -Tboot.ld

boot.o: boot.S
	$(CC) -c boot.S

kernel/kernel.img:
	@cd kernel;make

program1/program1.img:
	@cd program1;make

program2/program2.img:
	@cd program2;make

clean:
	@rm -rf boot.o boot.elf boot.bin *.img
