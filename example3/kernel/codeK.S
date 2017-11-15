.include "/home/ml/myos/include/386scd.h"
.include "/home/ml/myos/example3/local.h"

.code16
.section .text

movw        ldtSel,%ax
lldt        %ax 

movw        stacksSel,%ax
movw        %ax,%ss
movw        stackLen,%sp
jump16      codeLSel,vir2Address
vir3:
movw        normalSel,%ax
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs
movw        %ax,%ss

movl        %cr0,%eax
andb        $0xFE,%al
movl        %eax,%cr0
ljmp        $0x2040,$0x0

.org 512
