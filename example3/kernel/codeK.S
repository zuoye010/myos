.include "/home/ml/myos/include/386scd.h"

.equ        normalSel,      8
.equ        ldtSel,         24
.equ        codeLSel,       0+TIL
.equ        stacksSel,      40+TIL
.equ        stackLen,       255

.code16
.section .text

movw        ldtSel,%ax
lldt        %ax 

movw        stacksSel,%ax
movw        %ax,%ss
movw        stackLen,%sp
jump16      codeLSel,vir2
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
