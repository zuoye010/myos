.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x1040,%ax         #gdtSeg
movw        %ax,%ds

cld
call        initGdt
EnableA20

movl        $0,%edi

lgdt        %ds:11(,%edi,1)
cli

movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0

Jump16      0x40,0x0        #to tempCode rpl0   16

Real:
DisableA20
sti

inf:jmp inf

initGdt:
pushw       %ds
movw        $0x1060,%ax
movw        %ax,%ds
movw        $4,%cx              #ldtNum=6
movl        $0,%esi
movl        $64,%eax
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
movw        %ax,%ds:13(,%edi,1)
movw        %dx,%ds:15(,%edi,1)

ret

.org 512
