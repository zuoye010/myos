.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movl        $86,%esi
movl        $0,%edi
int         $0xfe
popl        %eax
addl        $4,%eax
pushl       %eax

iret

.org 512
