CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin ldt.bin mData.bin kernel.bin codeK.bin codeL.bin codeC.bin
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=ldt.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=tss.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=4 #用 bin file 生成对应的镜像文件
	@dd if=tempCode.bin of=kernel.img bs=512 count=1 seek=5 #用 bin file 生成对应的镜像文件
	@dd if=t32Code.bin of=kernel.img bs=512 count=1 seek=6 #用 bin file 生成对应的镜像文件
	@dd if=demoCode.bin of=kernel.img bs=512 count=1 seek=7 #用 bin file 生成对应的镜像文件
	@dd if=echoSub.bin of=kernel.img bs=512 count=1 seek=8 #用 bin file 生成对应的镜像文件

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

t32Code.bin: t32Code.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary t32Code.elf t32Code.bin

t32Code.elf: t32Code.o
	$(LD) t32Code.o -o t32Code.elf -e c -Tt32Code.ld

t32Code.o: t32Code.S
	$(CC) -c t32Code.S

demoCode.bin: demoCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demoCode.elf demoCode.bin

demoCode.elf: demoCode.o
	$(LD) demoCode.o -o demoCode.elf -e c -TdemoCode.ld

demoCode.o: demoCode.S
	$(CC) -c demoCode.S

echoSub.bin: echoSub.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary echoSub.elf echoSub.bin

echoSub.elf: echoSub.o
	$(LD) echoSub.o -o echoSub.elf -e c -TechoSub.ld

echoSub.o: echoSub.S
	$(CC) -c echoSub.S

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
