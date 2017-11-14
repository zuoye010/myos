.include "/home/ml/myos/include/386scd.h"

.equ        videoSel,       16+TIL
.equ        toLdtSel,       24+TIL
.equ        mDataSel,       32+TIL
.equ        stacksSel,      40+TIL

.code16
.section .text

movw    videoSel,%ax
movw    %ax,%es
movw    $1986,%di

movw    mDataSel,%ax
movw    %ax,%fs
movw    $0,%si
call16  0x10,0x0

movw    toLdtSel,%ax
movw    %ax,%gs
pushl   %edi
movl    $0,%edi
movl    $0,%eax
movw    %gs:(%eax,%edi,1),%dx
popl    %edi
movw    $7,%si
movw    $4,%cx
vir:
rol     $4,%dx
movb    %dl,%al
call16  0x10,0x1
movb    %al,%fs:0(,%esi,1)
inc     %si
loop    vir
movb    $72,%fs:0(,%esi,1)  
movw    $7,%si
call16  0x10,0x0
jump16  0x8,0x1
.org 512
