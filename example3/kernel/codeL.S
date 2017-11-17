.include "/home/ml/myos/include/386scd.h"

.code16
.section .text

movw    videoSel,%ax
movw    %ax,%es
movw    $1986,%di

movw    mDataSel,%ax
movw    %ax,%fs
movw    $0,%si
call16  codeCSel,dispMsgAddress

movw    toLdtSel,%ax
movw    %ax,%gs
pushl   %edi
movl    $0,%edi
movl    $0,%eax
movw    %gs:(%eax,%edi,1),%dx
popl    %edi
movw    bufferAddress,%si
movw    $4,%cx
vir:
rol     $4,%dx
movb    %dl,%al
call16  codeCSel,hToAsciiAddress
movb    %al,%fs:0(,%esi,1)
inc     %si
loop    vir
movb    $72,%fs:0(,%esi,1)  
movw    bufferAddress,%si
call16  codeCSel,dispMsgAddress
jump16  codeKSel,vir3Address
.org 512
