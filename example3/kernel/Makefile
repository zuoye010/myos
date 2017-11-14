CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: data.bin kernel.bin code32.bin code16.bin
	@dd if=data.bin of=kernel.img bs=512 count=1  #用 bin file 生成对应的镜像文件
	@dd if=kernel.bin of=kernel.img bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@dd if=code32.bin of=kernel.img bs=512 count=1 seek=2 #用 bin file 生成对应的镜像文件
	@dd if=code16.bin of=kernel.img bs=512 count=1 seek=3 #用 bin file 生成对应的镜像文件

kernel.bin: kernel.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary kernel.elf kernel.bin

kernel.elf: kernel.o
	$(LD) kernel.o -o kernel.elf -e c -Tkernel.ld

kernel.o: kernel.S
	$(CC) -c kernel.S

code32.bin: code32.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary code32.elf code32.bin

code32.elf: code32.o
	$(LD) code32.o -o code32.elf -e c -Tcode32.ld

code32.o: code32.S
	$(CC) -c code32.S

code16.bin: code16.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary code16.elf code16.bin

code16.elf: code16.o
	$(LD) code16.o -o code16.elf -e c -Tcode16.ld

code16.o: code16.S
	$(CC) -c code16.S

data.bin: data.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary data.elf data.bin

data.elf: data.o
	$(LD) data.o -o data.elf -e c -Tdata.ld

data.o: data.S
	$(CC) -c data.S

clean:
	@rm -rf *.o *.elf *.bin *.img
