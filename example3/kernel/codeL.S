.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw    $(16+TIL),%ax
movw    %ax,%es
movw    $1986,%di

movw    $(32+TIL),%ax
movw    %ax,%fs
movw    $0,%si
call16  (8+TIL),0

movw    $(24+TIL),%ax
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
call16  (8+TIL),0x1e
movb    %al,%fs:0(,%esi,1)
inc     %si
loop    vir
movb    $72,%fs:0(,%esi,1)  
movw    $7,%si
call16  (8+TIL),0x0
Jump16  16,0x13
.org 512
