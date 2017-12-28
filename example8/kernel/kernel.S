.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x1040,%ax         #bufferSeg
movw        %ax,%ds
movl        $0,%edi

sgdt        %ds:0(,%edi,1)
sidt        %ds:6(,%edi,1)
smsw        %ds:18(,%edi,1)

cld
call        initGdt
lgdt        %ds:12(,%edi,1)
cli
movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0
Jump16      0x10,0x0

Real:
sti

inf:jmp inf

initGdt:
pushw       %ds
movw        $0x1060,%ax
movw        %ax,%ds
movw        $4,%cx              #ldtNum=6
movl        $0,%esi
movl        $16,%eax
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
movw        %ax,%ds:14(,%edi,1)
movw        %dx,%ds:16(,%edi,1)

ret
.org 512
