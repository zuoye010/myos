.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

pushw       %ax
pushw       %ds
pushw       %es
pushl       %edi

movl        $0x0,%edi
movw        $0x40,%ax
movw        %ax,%ds
movw        $0x10,%ax
movw        %ax,%es
movw        %ds:0(,%edi,1),%ax
movw        %ax,%es:0(,%edi,1)

popl        %edi
popw        %es
popw        %ax
movw        %ax,%ds
popw        %ax

iret

.org 512
