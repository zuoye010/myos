.include "/home/ml/myos/include/386scd.h"

.section .data

.equ        bufLen,         256
.equ        gdtLen,         32
.equ        codeSel,        8
.equ        dataSSel,       16
.equ        dataDSel,       24

gdt:
dummy:      .space          descSize
code:
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
dataS:      
            .word           0xffff
            .word           0x0
            .byte           0x11
            .byte           ATDW
            .byte           0x0
            .byte           0x0
dataD:      
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0

vgdtr:
vgdtrBaseL: .word           31
vgttrBaseH: .word           0x0
            .word           0x0

buffer:     .space          bufLen
