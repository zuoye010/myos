.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

pushl       %ebp
movl        %esp,%ebp
pushl       %eax
pushl       %esi
pushl       %edi

movl        $114,%esi
movl        $0,%edi
int         $0xfe
movl        %ss:4(,%ebp,1),%eax
CALL32      0x58,0x0

popl        %edi
popl        %esi
popl        %eax
addw        $2,%ss:8(,%ebp,1)
popl        %ebp
addl        $4,%esp

iret

.org 512
