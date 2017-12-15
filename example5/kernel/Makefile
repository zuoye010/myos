CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin ldt.bin tempTss.bin demoTss.bin demoData.bin kernel.bin tempCode.bin demoCode.bin subR.bin
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=ldt.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=tempTss.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件
	@dd if=demoTss.bin of=kernel.img bs=512 count=1 seek=4 #用 bin file 生成对应的镜像文件
	@dd if=demoData.bin of=kernel.img bs=512 count=1 seek=5 #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=6 #用 bin file 生成对应的镜像文件
	@dd if=tempCode.bin of=kernel.img bs=512 count=1 seek=7 #用 bin file 生成对应的镜像文件
	@dd if=demoCode.bin of=kernel.img bs=512 count=1 seek=8 #用 bin file 生成对应的镜像文件
	@dd if=subR.bin of=kernel.img bs=512 count=1 seek=9 #用 bin file 生成对应的镜像文件

kernel.bin: kernel.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary kernel.elf kernel.bin

kernel.elf: kernel.o
	$(LD) kernel.o -o kernel.elf -e c -Tkernel.ld

kernel.o: kernel.S
	$(CC) -c kernel.S

tempCode.bin: tempCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary tempCode.elf tempCode.bin

tempCode.elf: tempCode.o
	$(LD) tempCode.o -o tempCode.elf -e c -TtempCode.ld

tempCode.o: tempCode.S
	$(CC) -c tempCode.S

demoCode.bin: demoCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demoCode.elf demoCode.bin

demoCode.elf: demoCode.o
	$(LD) demoCode.o -o demoCode.elf -e c -TdemoCode.ld

demoCode.o: demoCode.S
	$(CC) -c demoCode.S

subR.bin: subR.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary subR.elf subR.bin

subR.elf: subR.o
	$(LD) subR.o -o subR.elf -e c -TsubR.ld

subR.o: subR.S
	$(CC) -c subR.S

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

tempTss.bin: tempTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary tempTss.elf tempTss.bin

tempTss.elf: tempTss.o
	$(LD) tempTss.o -o tempTss.elf -e c -TtempTss.ld

tempTss.o: tempTss.S
	$(CC) -c tempTss.S

demoTss.bin: demoTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demoTss.elf demoTss.bin

demoTss.elf: demoTss.o
	$(LD) demoTss.o -o demoTss.elf -e c -TdemoTss.ld

demoTss.o: demoTss.S
	$(CC) -c demoTss.S

demoData.bin: demoData.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demoData.elf demoData.bin

demoData.elf: demoData.o
	$(LD) demoData.o -o demoData.elf -e c -TdemoData.ld

demoData.o: demoData.S
	$(CC) -c demoData.S

clean:
	@rm -rf *.o *.elf *.bin *.img
