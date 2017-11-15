.include "/home/ml/myos/include/386scd.h"

.section .data

gdt:
dummy:      .space          descSize
normal:
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
codeK:
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
ldtTable:
            .word           0x2f    #ldtLen-1=47
            .word           0x0
            .byte           0x0
            .byte           ATLDT
            .byte           0x0
            .byte           0x0
.org 512
