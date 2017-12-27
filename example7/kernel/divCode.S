.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movl        $0,%esi
movl        $0,%edi
int         $0xfe
shr         $1,%ax
popl        %eax
addl        $2,%eax
pushl       %eax

iret

.org 512
