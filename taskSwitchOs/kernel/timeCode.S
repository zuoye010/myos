.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

timeBegin:
cli 
movb        $0x20,%al
outb        %al,$0x20
xorl        %edi,%edi
movl        %ds:0(,%edi,1),%eax
movl        $0x48,%ds:0(,%edi,1)
movb        $AT386TSS,%es:5(%eax,%edi,1)    #0x8b--->0x89
iret
jmp         timeBegin

.org 512
