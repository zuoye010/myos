CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin kernel.bin codeK.bin 
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=codeK.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件

kernel.bin: kernel.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary kernel.elf kernel.bin

kernel.elf: kernel.o
	$(LD) kernel.o -o kernel.elf -e c -Tkernel.ld

kernel.o: kernel.S
	$(CC) -c kernel.S

codeK.bin: codeK.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary codeK.elf codeK.bin

codeK.elf: codeK.o
	$(LD) codeK.o -o codeK.elf -e c -TcodeK.ld

codeK.o: codeK.S
	$(CC) -c codeK.S

data.bin: data.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary data.elf data.bin

data.elf: data.o
	$(LD) data.o -o data.elf -e c -Tdata.ld

data.o: data.S
	$(CC) -c data.S

gdt.bin: gdt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary gdt.elf gdt.bin

gdt.elf: gdt.o
	$(LD) gdt.o -o gdt.elf -e c -Tgdt.ld

gdt.o: gdt.S
	$(CC) -c gdt.S

clean:
	@rm -rf *.o *.elf *.bin *.img
