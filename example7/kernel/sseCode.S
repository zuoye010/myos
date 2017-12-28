.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movl        $85,%esi
movl        $0,%edi
int         $0xfe
popl        %eax
CALL32      0x58,0x0
popl        %eax
addl        $9,%eax
pushl       %eax

iret

.org 512
