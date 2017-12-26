CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin gKeyLdt.bin gKeyTss.bin buffer.bin dLdt.bin dTss.bin demoData.bin idt.bin  kernel.bin tempCode.bin demoCode.bin echoCode.bin subCode.bin gpCode.bin sseCode.bin snpCode.bin offCode.bin divCode.bin otherCode.bin gKeyCode.bin
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=gKeyLdt.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=gKeyTss.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件
	@dd if=buffer.bin of=kernel.img bs=512 count=1 seek=4 #用 bin file 生成对应的镜像文件
	@dd if=dLdt.bin of=kernel.img bs=512 count=1 seek=5 #用 bin file 生成对应的镜像文件
	@dd if=dTss.bin of=kernel.img bs=512 count=1 seek=6 #用 bin file 生成对应的镜像文件
	@dd if=demoData.bin of=kernel.img bs=512 count=1 seek=7 #用 bin file 生成对应的镜像文件
	@dd if=idt.bin of=kernel.img bs=512 count=4 seek=8 #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=12 #用 bin file 生成对应的镜像文件
	@dd if=tempCode.bin of=kernel.img bs=512 count=1 seek=13 #用 bin file 生成对应的镜像文件
	@dd if=demoCode.bin of=kernel.img bs=512 count=1 seek=14 #用 bin file 生成对应的镜像文件
	@dd if=echoCode.bin of=kernel.img bs=512 count=1 seek=15 #用 bin file 生成对应的镜像文件
	@dd if=subCode.bin of=kernel.img bs=512 count=1 seek=16 #用 bin file 生成对应的镜像文件
	@dd if=gpCode.bin of=kernel.img bs=512 count=1 seek=17 #用 bin file 生成对应的镜像文件
	@dd if=sseCode.bin of=kernel.img bs=512 count=1 seek=18 #用 bin file 生成对应的镜像文件
	@dd if=snpCode.bin of=kernel.img bs=512 count=1 seek=19 #用 bin file 生成对应的镜像文件
	@dd if=offCode.bin of=kernel.img bs=512 count=1 seek=20 #用 bin file 生成对应的镜像文件
	@dd if=divCode.bin of=kernel.img bs=512 count=1 seek=21 #用 bin file 生成对应的镜像文件
	@dd if=otherCode.bin of=kernel.img bs=512 count=1 seek=22 #用 bin file 生成对应的镜像文件
	@dd if=gKeyCode.bin of=kernel.img bs=512 count=1 seek=23 #用 bin file 生成对应的镜像文件

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

subCode.bin: subCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary subCode.elf subCode.bin

subCode.elf: subCode.o
	$(LD) subCode.o -o subCode.elf -e c -TsubCode.ld

subCode.o: subCode.S
	$(CC) -c subCode.S

gpCode.bin: gpCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary gpCode.elf gpCode.bin

gpCode.elf: gpCode.o
	$(LD) gpCode.o -o gpCode.elf -e c -TgpCode.ld

gpCode.o: gpCode.S
	$(CC) -c gpCode.S

sseCode.bin: sseCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary sseCode.elf sseCode.bin

sseCode.elf: sseCode.o
	$(LD) sseCode.o -o sseCode.elf -e c -TsseCode.ld

sseCode.o: sseCode.S
	$(CC) -c sseCode.S

snpCode.bin: snpCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary snpCode.elf snpCode.bin

snpCode.elf: snpCode.o
	$(LD) snpCode.o -o snpCode.elf -e c -TsnpCode.ld

snpCode.o: snpCode.S
	$(CC) -c snpCode.S

offCode.bin: offCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary offCode.elf offCode.bin

offCode.elf: offCode.o
	$(LD) offCode.o -o offCode.elf -e c -ToffCode.ld

offCode.o: offCode.S
	$(CC) -c offCode.S

divCode.bin: divCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary divCode.elf divCode.bin

divCode.elf: divCode.o
	$(LD) divCode.o -o divCode.elf -e c -TdivCode.ld

divCode.o: divCode.S
	$(CC) -c divCode.S
otherCode.bin: otherCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary otherCode.elf otherCode.bin

otherCode.elf: otherCode.o
	$(LD) otherCode.o -o otherCode.elf -e c -TotherCode.ld

otherCode.o: otherCode.S
	$(CC) -c otherCode.S

gKeyCode.bin: gKeyCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary gKeyCode.elf gKeyCode.bin

gKeyCode.elf: gKeyCode.o
	$(LD) gKeyCode.o -o gKeyCode.elf -e c -TgKeyCode.ld

gKeyCode.o: gKeyCode.S
	$(CC) -c gKeyCode.S

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

gKeyLdt.bin: gKeyLdt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary gKeyLdt.elf gKeyLdt.bin

gKeyLdt.elf: gKeyLdt.o
	$(LD) gKeyLdt.o -o gKeyLdt.elf -e c -TgKeyLdt.ld

gKeyLdt.o: gKeyLdt.S
	$(CC) -c gKeyLdt.S

gKeyTss.bin: gKeyTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary gKeyTss.elf gKeyTss.bin

gKeyTss.elf: gKeyTss.o
	$(LD) gKeyTss.o -o gKeyTss.elf -e c -TgKeyTss.ld

gKeyTss.o: gKeyTss.S
	$(CC) -c gKeyTss.S

buffer.bin: buffer.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary buffer.elf buffer.bin

buffer.elf: buffer.o
	$(LD) buffer.o -o buffer.elf -e c -Tbuffer.ld

buffer.o: buffer.S
	$(CC) -c buffer.S

dLdt.bin: dLdt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary dLdt.elf dLdt.bin

dLdt.elf: dLdt.o
	$(LD) dLdt.o -o dLdt.elf -e c -TdLdt.ld

dLdt.o: dLdt.S
	$(CC) -c dLdt.S

dTss.bin: dTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary dTss.elf dTss.bin

dTss.elf: dTss.o
	$(LD) dTss.o -o dTss.elf -e c -TdTss.ld

dTss.o: dTss.S
	$(CC) -c dTss.S

demoData.bin: demoData.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demoData.elf demoData.bin

demoData.elf: demoData.o
	$(LD) demoData.o -o demoData.elf -e c -TdemoData.ld

demoData.o: demoData.S
	$(CC) -c demoData.S

idt.bin: idt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary idt.elf idt.bin

idt.elf: idt.o
	$(LD) idt.o -o idt.elf -e c -Tidt.ld

idt.o: idt.S
	$(CC) -c idt.S

clean:
	@rm -rf *.o *.elf *.bin *.img
