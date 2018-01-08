.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

aBegin:
xorl    %edi,%edi
xorl    %eax,%eax
xorl    %ecx,%ecx
movb    $0x17,%bh
movb    $0x41,%bl
movw    $3,%cx

showMess:
movw    %es:17(,%edi,1),%ax
movw    %bx,%ds:0(%eax,%edi,1)
cmpw    3998,%ax
jnz     increase1
movw    $0,%ax
jmp     finishSetA
increase1:
addw    $2,%ax
finishSetA:
movw    %ax,%es:17(,%edi,1)
loop    showMess

jmp     aBegin

.org 512
