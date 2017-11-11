CC=gcc
LD=ld
LDFILE=boot.ld #使用上面提供的连接脚本 solrex_x86.ld
OBJCOPY=objcopy

all: boot.img

boot.img: boot.bin	kernel/kernel.img program1/program1.img program2/program2.img
	@cp ./kernel/kernel.img ./
	@cp ./program1/program1.img ./
	@cp ./program2/program2.img ./
	@dd if=/dev/zero of=emptydisk.img bs=512 count=2880 #生成空白软盘镜像文件
	@dd if=boot.bin of=boot.img bs=512 count=1 #用 bin file 生成对应的镜像文件
	@dd if=kernel.img of=boot.img skip=0 seek=1 bs=512 count=1 #在 bin 生成的镜像文件后补上kernel
	@dd if=program1.img of=boot.img skip=0 seek=2 bs=512 count=1 #在 bin 生成的镜像文件后补上program1
	@dd if=program2.img of=boot.img skip=0 seek=3 bs=512 count=1 #在 bin 生成的镜像文件后补上program1
	@dd if=emptydisk.img of=boot.img skip=4 seek=4 bs=512 count=2876 #在 bin 生成的镜像文件后补上空白，最后成为合适大小的软盘镜像

boot.bin: boot.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary boot.elf boot.bin

boot.elf: boot.o
	$(LD) boot.o -o boot.elf -e c -Tboot.ld

boot.o: boot.S
	$(CC) -c boot.S

kernel/kernel.img:
	@cd kernel;make

program1/program1.img:
	@cd program1;make

program2/program2.img:
	@cd program2;make

clean:
	@rm -rf boot.o boot.elf boot.bin *.img
	@cd kernel;make clean
	@cd program1;make clean
	@cd program2;make clean
