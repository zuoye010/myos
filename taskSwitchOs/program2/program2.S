.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

bBegin:
xorl    %edi,%edi
xorl    %eax,%eax
xorl    %ecx,%ecx
movb    $0x17,%bh
movb    $0x42,%bl
movw    $3,%cx

showMess:
movw    %ds:13(,%edi,1),%ax
movw    %bx,%es:0(%eax,%edi,1)
cmpw    $3998,%ax
jnz     increase1
movw    $0,%ax
call    clearAllScreen
jmp     finishSetA
increase1:
addw    $2,%ax
finishSetA:
movw    %ax,%ds:13(,%edi,1)
loop    showMess

jmp     bBegin
jmp     bBegin

clearAllScreen:
pushl   %eax
pushl   %edi
pushl   %ecx
movb    $0x0,%ah
movb    $0x20,%al
movl    $1999,%ecx
clearScreen:
stosw
loop    clearScreen
popl    %ecx
popl    %edi
popl    %eax
ret

.org 512
