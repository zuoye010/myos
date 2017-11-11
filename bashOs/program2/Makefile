CC=gcc
LD=ld
LDFILE=program2.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: program2.img

program2.img: program2.bin
	@dd if=program2.bin of=program2.img bs=512 count=1 #用 bin file 生成对应的镜像文件

program2.bin: program2.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary program2.elf program2.bin

program2.elf: program2.o
	$(LD) program2.o -o program2.elf -e c -Tprogram2.ld

program2.o: program2.S
	$(CC) -c program2.S

clean:
	@rm -rf program2.o program2.elf program2.bin program2.img
