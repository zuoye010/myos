.include "/home/ml/myos/include/386scd.h"

.code16
.section .text

movw        $0x1060,%ax         #gdtSeg
movw        %ax,%ds

movw        $0x2060,%ax         #codeKSeg
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%bx
movl        $16,%eax
movw        %bx,%ds:desc.baseL(%eax,%edi,1 )
movb        %dl,%ds:desc.baseM(%eax,%edi,1 )
movb        %dh,%ds:desc.baseH(%eax,%edi,1 )

movw        $0x1080,%ax         #ldtSeg
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%bx
movl        $24,%eax
movw        %bx,%ds:desc.baseL(%eax,%edi,1 )
movb        %dl,%ds:desc.baseM(%eax,%edi,1 )
movb        %dh,%ds:desc.baseH(%eax,%edi,1 )

movw        $0x1040,%ax         #dataSeg
movw        %ax,%ds
movw        $0x1060,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%ds:2(,%edi,1)
movw        %dx,%ds:4(,%edi,1)

cld
call        initMLdt

movw        $0x1040,%ax         #dataSeg
movw        %ax,%ds
movl        $0,%edi
movw        %ss,%ds:8(,%edi,1)
movw        %sp,%ds:6(,%edi,1)

lgdt        %ds:0(,%edi,1)
cli

movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0

Jump16      0x10,0x0

Real:
movw        $0x1040,%ax
movw        %ax,%ds
movl        $0,%edi
lss         %ds:6(,%edi,1),%sp
sti

inf:jmp inf

initMLdt:
pushw       %ds
movw        $0x1080,%ax
movw        %ax,%ds
movw        $6,%cx              #ldtNum=6
movl        $0,%esi
movl        $0,%eax
initL:
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
loop        initL
popw        %ds
ret

.org 512
