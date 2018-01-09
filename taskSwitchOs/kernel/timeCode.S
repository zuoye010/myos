.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

timeBegin:
cli 
movb        $0x20,%al
outb        %al,$0x20
xorl        %edi,%edi
movl        $0x48,%ds:0(,%edi,1)
iret
jmp         timeBegin

.org 512
