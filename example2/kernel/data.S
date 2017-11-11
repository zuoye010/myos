.include "/home/ml/myos/include/386scd.h"

.section .data

.equ        dataLen,        16
.equ        gdtLen,         56
.equ        normalSel,      8
.equ        code32Sel,      16
.equ        code16Sel,      24
.equ        dataSSel,       32
.equ        dataDSel,       40
.equ        stacksSel,      48

gdt:
dummy:      .space          descSize
normal:
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
code32:
            .word           1     #c32Len-1
            .word           0x0
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
code16:
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
dataS:      
            .word           15       #dataLen-1
            .word           0x0
            .byte           0x10
            .byte           ATDR
            .byte           0x0
            .byte           0x0
dataD:      
            .word           0x3999
            .word           0x8000
            .byte           0x0b
            .byte           ATDW
            .byte           0x0
            .byte           0x0
stackS:      
            .word           255     #stackLen-1
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0

vgdtr:
vgdtrBaseL: .word           55
vgttrBaseH: .word           0x0
            .word           0x0

buffer:     .space          bufLen

saveSp:     .word           0x00
saveSs:     .word           0x00

.org 512
