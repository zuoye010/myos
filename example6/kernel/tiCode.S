.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

pushl       %eax
pushw       %ds
pushw       %fs
pushw       %gs
pushl       %edi

movl        $0x0,%edi
movw        $0x48,%ax
movw        %ax,%ds
movw        $0x38,%ax
movw        %ax,%fs
movw        $0x28,%ax
movw        %ax,%gs

cmpb        $0x0,%ds:0(,%edi,1)
jnz         Ti2
movb        $18,%ds:0(,%edi,1)
int         $0xfe

cmpb        $0x30,%fs:0(,%edi,1)
jnz         Ti1
movb        $0x1,%gs:0(,%edi,1)
Ti1:
decb        %fs:0(,%edi,1)
Ti2:
decb        %ds:0(,%edi,1)

popl        %edi
popw        %gs
popw        %fs
popw        %ds
movb        $0x20,%al
outb        %al,$0x20
popl        %eax

iret

.org 512
