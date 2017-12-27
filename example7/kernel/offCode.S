.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movl        $27,%esi
movl        $0,%edi
int         $0xfe

iret

.org 512
