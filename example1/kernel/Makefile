CC=gcc
LD=ld
LDFILE=kernel.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: kernel.img

kernel.img: kernel.tmp data.bin
	@dd if=data.bin of=kernel.tmp bs=512 count=1 seek=1 #用 bin file 生成对应的镜像文件
	@mv kernel.tmp kernel.img

kernel.tmp: kernel.bin
	@dd if=kernel.bin of=kernel.tmp bs=512 count=1 #用 bin file 生成对应的镜像文件

kernel.bin: kernel.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary kernel.elf kernel.bin

kernel.elf: kernel.o
	$(LD) kernel.o -o kernel.elf -e c -Tkernel.ld

kernel.o: kernel.S
	$(CC) -c kernel.S


data.bin: data.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary data.elf data.bin

data.elf: data.o
	$(LD) data.o -o data.elf -e c -Tdata.ld

data.o: data.S
	$(CC) -c data.S

clean:
	@rm -rf *.o *.elf *.bin *.img
