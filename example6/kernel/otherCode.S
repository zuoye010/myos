.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

pushl       %edi

movl        $0x0,%edi

movw        $0x10,%ax
movw        %ax,%es
movb        $0x17,%ah
movb        $0x21,%al
movw        %ax,%es:0(,%edi,1)
now:
jmp         now

popl        %edi        

iret

.org 512
