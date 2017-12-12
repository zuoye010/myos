.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x1040,%ax         #gdtSeg
movw        %ax,%ds

cld
call        initGdt

movw        $0x1080,%ax         #ldtSeg
movw        %ax,%fs
movl        $0,%esi
movw        $6,%cx
movl        $0,%eax

call        initMLdt

movl        $0,%edi
movw        %ss,%ds:8(,%edi,1)
movw        %sp,%ds:6(,%edi,1)

lgdt        %ds:0(,%edi,1)
cli

movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0

Jump16      0x28,0x0        #to tempCode rpl0   16

Real:
movw        $0x1040,%ax
movw        %ax,%ds
movl        $0,%edi
lss         %ds:6(,%edi,1),%sp
sti

inf:jmp inf

initGdt:
pushw       %ds
movw        $0x1060,%ax
movw        %ax,%ds
movw        $3,%cx              #ldtNum=6
movl        $0,%esi
movl        $24,%eax
initG:
movl        $0,%ebx
movw        %ds:desc.baseL(%eax,%esi,1),%bx
movzx       %bx,%ebx
shl         $4,%ebx
movl        $0,%edx
shld        $16,%ebx,%edx
movw        %bx,%ds:desc.baseL(%eax,%esi,1)
movb        %dl,%ds:desc.baseM(%eax,%esi,1)
movb        %dh,%ds:desc.baseH(%eax,%esi,1)
addl        $8,%eax
loop        initG
popw        %ds

movw        $0x1060,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%ds:2(,%edi,1)
movw        %dx,%ds:4(,%edi,1)

ret

initMLdt:
initL:
movl        $0,%ebx
movw        %fs:desc.baseL(%eax,%esi,1),%bx
movzx       %bx,%ebx
shl         $4,%ebx
movl        $0,%edx
shld        $16,%ebx,%edx
movw        %bx,%fs:desc.baseL(%eax,%esi,1)
movb        %dl,%fs:desc.baseM(%eax,%esi,1)
movb        %dh,%fs:desc.baseH(%eax,%esi,1)
addl        $8,%eax
loop        initL
ret

.org 512
