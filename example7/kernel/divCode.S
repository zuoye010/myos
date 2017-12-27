.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movl        $0,%esi
movl        $0,%edi
int         $0xfe
shr         $1,%ax

iret

.org 512
