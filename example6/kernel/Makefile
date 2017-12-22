CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin demoData.bin echoData.bin tiData.bin idt.bin  kernel.bin tempCode.bin demoCode.bin echoCode.bin tiCode.bin otherCode.bin
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=demoData.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=echoData.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件
	@dd if=tiData.bin of=kernel.img bs=512 count=1 seek=4 #用 bin file 生成对应的镜像文件
	@dd if=idt.bin of=kernel.img bs=512 count=4 seek=5 #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=9 #用 bin file 生成对应的镜像文件
	@dd if=tempCode.bin of=kernel.img bs=512 count=1 seek=10 #用 bin file 生成对应的镜像文件
	@dd if=demoCode.bin of=kernel.img bs=512 count=1 seek=11 #用 bin file 生成对应的镜像文件
	@dd if=echoCode.bin of=kernel.img bs=512 count=1 seek=12 #用 bin file 生成对应的镜像文件
	@dd if=tiCode.bin of=kernel.img bs=512 count=1 seek=13 #用 bin file 生成对应的镜像文件
	@dd if=otherCode.bin of=kernel.img bs=512 count=1 seek=14 #用 bin file 生成对应的镜像文件

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

echoCode.bin: echoCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary echoCode.elf echoCode.bin

echoCode.elf: echoCode.o
	$(LD) echoCode.o -o echoCode.elf -e c -TechoCode.ld

echoCode.o: echoCode.S
	$(CC) -c echoCode.S

tiCode.bin: tiCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary tiCode.elf tiCode.bin

tiCode.elf: tiCode.o
	$(LD) tiCode.o -o tiCode.elf -e c -TtiCode.ld

tiCode.o: tiCode.S
	$(CC) -c tiCode.S

otherCode.bin: otherCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary otherCode.elf otherCode.bin

otherCode.elf: otherCode.o
	$(LD) otherCode.o -o otherCode.elf -e c -TotherCode.ld

otherCode.o: otherCode.S
	$(CC) -c otherCode.S

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

demoData.bin: demoData.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demoData.elf demoData.bin

demoData.elf: demoData.o
	$(LD) demoData.o -o demoData.elf -e c -TdemoData.ld

demoData.o: demoData.S
	$(CC) -c demoData.S

echoData.bin: echoData.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary echoData.elf echoData.bin

echoData.elf: echoData.o
	$(LD) echoData.o -o echoData.elf -e c -TechoData.ld

echoData.o: echoData.S
	$(CC) -c echoData.S

tiData.bin: tiData.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary tiData.elf tiData.bin

tiData.elf: tiData.o
	$(LD) tiData.o -o tiData.elf -e c -TtiData.ld

tiData.o: tiData.S
	$(CC) -c tiData.S

idt.bin: idt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary idt.elf idt.bin

idt.elf: idt.o
	$(LD) idt.o -o idt.elf -e c -Tidt.ld

idt.o: idt.S
	$(CC) -c idt.S

clean:
	@rm -rf *.o *.elf *.bin *.img
