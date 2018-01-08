.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

osBegin:
cli
xorl    %edi,%edi
xorl    %eax,%eax
xorl    %ebx,%ebx
movb    %ds:12(,%edi,1 ),%al
cmpb    $0,%al                  #now is aTask
jz      is0

is1:
movb    $0,%ds:12(,%edi,1 )     #next is aTask
sti
CALL32  0x48,0x0
jmp     toTaskJump

is0:                            #next is bTask
movb    $1,%ds:12(,%edi,1 )
CALL32  0x58,0x0

toTaskJump:
jmp     osBegin

.org 512
