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
videoBuf:
            .word           0x7fff
            .word           0x8000
            .byte           0xb
            .byte           ATDW+DPL3
            .byte           0x0
            .byte           0x0
demoTss:
            .word           0x69    #106-1=105=0x69
            .word           0x10a0
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
demoLdt:
            .word           0x3f    #ldtLen-1=71
            .word           0x1080
            .byte           0x0
            .byte           ATLDT
            .byte           0x0
            .byte           0x0
tempCode:
            .word           0xffff    
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
.org 512
