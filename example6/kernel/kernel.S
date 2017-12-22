.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x1040,%ax         #gdtSeg
movw        %ax,%ds

cld
call        initGdt
call        initIdt

movl        $0,%edi
movw        %ss,%ds:20(,%edi,1)
movw        %sp,%ds:18(,%edi,1)

sidt        %ds:12(,%edi,1)
inb         $0x21,%al
movb        %al,%ds:22(,%edi,1)
lgdt        %ds:0(,%edi,1)
cli
lidt        %ds:6(,%edi,1)

movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0

Jump16      0x18,0x0        #to tempCode rpl0   16

Real:
movw        $0x1040,%ax
movw        %ax,%ds
movl        $0,%edi
lss         %ds:6(,%edi,1),%sp
lidt        %ds:12(,%edi,1)
movb        %ds:22(,%edi,1),%al
outb        %al,$0x21
sti

inf:jmp inf

initGdt:
pushw       %ds
movw        $0x1060,%ax
movw        %ax,%ds
movw        $9,%cx              #ldtNum=6
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

initIdt:
initI:
movw        $0x1400,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%ds:8(,%edi,1)
movw        %dx,%ds:10(,%edi,1)
ret

.org 512
