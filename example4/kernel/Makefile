CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin ldt.bin mData.bin kernel.bin codeK.bin codeL.bin codeC.bin
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=ldt.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=mData.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=4 #用 bin file 生成对应的镜像文件
	@dd if=codeK.bin of=kernel.img bs=512 count=1 seek=5 #用 bin file 生成对应的镜像文件
	@dd if=codeL.bin of=kernel.img bs=512 count=1 seek=6 #用 bin file 生成对应的镜像文件
	@dd if=codeC.bin of=kernel.img bs=512 count=1 seek=7 #用 bin file 生成对应的镜像文件

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

codeL.bin: codeL.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary codeL.elf codeL.bin

codeL.elf: codeL.o
	$(LD) codeL.o -o codeL.elf -e c -TcodeL.ld

codeL.o: codeL.S
	$(CC) -c codeL.S

codeC.bin: codeC.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary codeC.elf codeC.bin

codeC.elf: codeC.o
	$(LD) codeC.o -o codeC.elf -e c -TcodeC.ld

codeC.o: codeC.S
	$(CC) -c codeC.S

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

ldt.bin: ldt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary ldt.elf ldt.bin

ldt.elf: ldt.o
	$(LD) ldt.o -o ldt.elf -e c -Tldt.ld

ldt.o: ldt.S
	$(CC) -c ldt.S

tss.bin: tss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary tss.elf tss.bin

tss.elf: tss.o
	$(LD) tss.o -o tss.elf -e c -Ttss.ld

tss.o: tss.S
	$(CC) -c tss.S

clean:
	@rm -rf *.o *.elf *.bin *.img
