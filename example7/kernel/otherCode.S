.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movl        $148,%esi
int         $0xfe
movw        %ax,%es:0(,%edi,1)
now:
jmp         now

iret

.org 512
