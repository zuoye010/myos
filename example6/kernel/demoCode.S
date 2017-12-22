.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x30,%ax 
movw        %ax,%ss
movw        $0x400,%sp
movw        $0x28,%ax
movw        %ax,%ds
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs
movb        $0xFE,%al
outb        %al,$0x21
sti
movl        $0x0,%edi
DemoContinue:
cmpb        $0x0,%ds:0(,%edi,1)
jz          DemoContinue
cli
Jump16      0x18,0x5
.org 512
