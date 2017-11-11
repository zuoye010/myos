CC=gcc
LD=ld
LDFILE=program1.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: program1.img

program1.img: program1.bin
	@dd if=program1.bin of=program1.img bs=512 count=1 #用 bin file 生成对应的镜像文件

program1.bin: program1.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary program1.elf program1.bin

program1.elf: program1.o
	$(LD) program1.o -o program1.elf -e c -Tprogram1.ld

program1.o: program1.S
	$(CC) -c program1.S

clean:
	@rm -rf program1.o program1.elf program1.bin program1.img
