CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin timeTss.bin osTss.bin aTss.bin bTss.bin aLdt.bin bLdt.bin idt.bin initGdtIdtLdt.bin initPage.bin timeCode.bin osCode.bin otherCode.bin
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=timeTss.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=osTss.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件
	@dd if=aTss.bin of=kernel.img bs=512 count=1 seek=4 #用 bin file 生成对应的镜像文件
	@dd if=bTss.bin of=kernel.img bs=512 count=1 seek=5 #用 bin file 生成对应的镜像文件
	@dd if=aLdt.bin of=kernel.img bs=512 count=1 seek=6 #用 bin file 生成对应的镜像文件
	@dd if=bLdt.bin of=kernel.img bs=512 count=1 seek=7 #用 bin file 生成对应的镜像文件
	@dd if=idt.bin of=kernel.img bs=512 count=4 seek=8 #用 bin file 生成对应的镜像文件
	@dd if=initGdtIdtLdt.bin of=kernel.img bs=512 count=1 seek=12 #用 bin file 生成对应的镜像文件
	@dd if=initPage.bin of=kernel.img bs=512 count=1 seek=13 #用 bin file 生成对应的镜像文件
	@dd if=timeCode.bin of=kernel.img bs=512 count=1 seek=14 #用 bin file 生成对应的镜像文件
	@dd if=osCode.bin of=kernel.img bs=512 count=1 seek=15 #用 bin file 生成对应的镜像文件
	@dd if=otherCode.bin of=kernel.img bs=512 count=1 seek=16 #用 bin file 生成对应的镜像文件

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

timeTss.bin: timeTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary timeTss.elf timeTss.bin

timeTss.elf: timeTss.o
	$(LD) timeTss.o -o timeTss.elf -e c -TtimeTss.ld

timeTss.o: timeTss.S
	$(CC) -c timeTss.S


osTss.bin: osTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary osTss.elf osTss.bin

osTss.elf: osTss.o
	$(LD) osTss.o -o osTss.elf -e c -TosTss.ld

osTss.o: osTss.S
	$(CC) -c osTss.S


aTss.bin: aTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary aTss.elf aTss.bin

aTss.elf: aTss.o
	$(LD) aTss.o -o aTss.elf -e c -TaTss.ld

aTss.o: aTss.S
	$(CC) -c aTss.S


bTss.bin: bTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary bTss.elf bTss.bin

bTss.elf: bTss.o
	$(LD) bTss.o -o bTss.elf -e c -TbTss.ld

bTss.o: bTss.S
	$(CC) -c bTss.S


aLdt.bin: aLdt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary aLdt.elf aLdt.bin

aLdt.elf: aLdt.o
	$(LD) aLdt.o -o aLdt.elf -e c -TaLdt.ld

aLdt.o: aLdt.S
	$(CC) -c aLdt.S


bLdt.bin: bLdt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary bLdt.elf bLdt.bin

bLdt.elf: bLdt.o
	$(LD) bLdt.o -o bLdt.elf -e c -TbLdt.ld

bLdt.o: bLdt.S
	$(CC) -c bLdt.S


idt.bin: idt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary idt.elf idt.bin

idt.elf: idt.o
	$(LD) idt.o -o idt.elf -e c -Tidt.ld

idt.o: idt.S
	$(CC) -c idt.S


initGdtIdtLdt.bin: initGdtIdtLdt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary initGdtIdtLdt.elf initGdtIdtLdt.bin

initGdtIdtLdt.elf: initGdtIdtLdt.o
	$(LD) initGdtIdtLdt.o -o initGdtIdtLdt.elf -e c -TinitGdtIdtLdt.ld

initGdtIdtLdt.o: initGdtIdtLdt.S
	$(CC) -c initGdtIdtLdt.S


initPage.bin: initPage.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary initPage.elf initPage.bin

initPage.elf: initPage.o
	$(LD) initPage.o -o initPage.elf -e c -TinitPage.ld

initPage.o: initPage.S
	$(CC) -c initPage.S

timeCode.bin: timeCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary timeCode.elf timeCode.bin

timeCode.elf: timeCode.o
	$(LD) timeCode.o -o timeCode.elf -e c -TtimeCode.ld

timeCode.o: timeCode.S
	$(CC) -c timeCode.S

osCode.bin: osCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary osCode.elf osCode.bin

osCode.elf: osCode.o
	$(LD) osCode.o -o osCode.elf -e c -TosCode.ld

osCode.o: osCode.S
	$(CC) -c osCode.S

otherCode.bin: otherCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary otherCode.elf otherCode.bin

otherCode.elf: otherCode.o
	$(LD) otherCode.o -o otherCode.elf -e c -TotherCode.ld

otherCode.o: otherCode.S
	$(CC) -c otherCode.S

clean:
	@rm -rf *.o *.elf *.bin *.img
