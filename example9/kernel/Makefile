CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin gdt.bin demoTss.bin gpTss.bin testTss.bin idt.bin  kernel.bin tempCode.bin demoCode.bin gpCode.bin testCode.bin errCode.bin 
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=gdt.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=demoTss.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=gpTss.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件
	@dd if=testTss.bin of=kernel.img bs=512 count=1 seek=4 #用 bin file 生成对应的镜像文件
	@dd if=idt.bin of=kernel.img bs=512 count=4 seek=5 #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=9 #用 bin file 生成对应的镜像文件
	@dd if=tempCode.bin of=kernel.img bs=512 count=1 seek=10 #用 bin file 生成对应的镜像文件
	@dd if=demoCode.bin of=kernel.img bs=512 count=1 seek=11 #用 bin file 生成对应的镜像文件
	@dd if=gpCode.bin of=kernel.img bs=512 count=1 seek=12 #用 bin file 生成对应的镜像文件
	@dd if=testCode.bin of=kernel.img bs=512 count=1 seek=13 #用 bin file 生成对应的镜像文件
	@dd if=errCode.bin of=kernel.img bs=512 count=1 seek=14 #用 bin file 生成对应的镜像文件

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

gpCode.bin: gpCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary gpCode.elf gpCode.bin

gpCode.elf: gpCode.o
	$(LD) gpCode.o -o gpCode.elf -e c -TgpCode.ld

gpCode.o: gpCode.S
	$(CC) -c gpCode.S

testCode.bin: testCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary testCode.elf testCode.bin

testCode.elf: testCode.o
	$(LD) testCode.o -o testCode.elf -e c -TtestCode.ld

testCode.o: testCode.S
	$(CC) -c testCode.S

errCode.bin: errCode.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary errCode.elf errCode.bin

errCode.elf: errCode.o
	$(LD) errCode.o -o errCode.elf -e c -TerrCode.ld

errCode.o: errCode.S
	$(CC) -c errCode.S

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

demoTss.bin: demoTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary demoTss.elf demoTss.bin

demoTss.elf: demoTss.o
	$(LD) demoTss.o -o demoTss.elf -e c -TdemoTss.ld

demoTss.o: demoTss.S
	$(CC) -c demoTss.S

gpTss.bin: gpTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary gpTss.elf gpTss.bin

gpTss.elf: gpTss.o
	$(LD) gpTss.o -o gpTss.elf -e c -TgpTss.ld

gpTss.o: gpTss.S
	$(CC) -c gpTss.S

testTss.bin: testTss.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary testTss.elf testTss.bin

testTss.elf: testTss.o
	$(LD) testTss.o -o testTss.elf -e c -TtestTss.ld

testTss.o: testTss.S
	$(CC) -c testTss.S

idt.bin: idt.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary idt.elf idt.bin

idt.elf: idt.o
	$(LD) idt.o -o idt.elf -e c -Tidt.ld

idt.o: idt.S
	$(CC) -c idt.S

clean:
	@rm -rf *.o *.elf *.bin *.img
