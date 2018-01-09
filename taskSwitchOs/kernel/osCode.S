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
movl    %fs:36(,%edi,1),%eax
orl     $0x200,%eax
andl    $0xFFFFBFFF,%eax
movl    %eax,%fs:36(,%edi,1)
movl    $0,%fs:0(,%edi,1)
#movl    $0x58,%es:0(,%edi,1)
CALL32  0x58,0
jmp     osBegin

is0:                            #next is bTask
movb    $1,%ds:12(,%edi,1 )
movl    %gs:36(,%edi,1),%eax
orl     $0x200,%eax
andl    $0xFFFFBFFF,%eax
movl    %eax,%gs:36(,%edi,1)
movl    $0,%gs:0(,%edi,1)
#movl    $0x68,%es:0(,%edi,1)
CALL32  0x68,0x0
jmp     osBegin

.org 512
