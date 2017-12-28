.include "/home/xx/myos/include/386scd.h"

.section .data

gdt:

dummy:      .space          descSize            #0x0

normal:                                         #0x8
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0

tempCode:                                       #0x10
            .word           0xffff
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0

buffer:                                         #0x18
            .word           0x45                #ldtLen-1=69
            .word           0x1040
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0

test1:                                          #0x20
            .word           0x1111              #ldtLen-1=47
            .word           0x0
            .byte           0x0
            .byte           0x92
            .byte           0x87
            .byte           0x0

test2:                                          #0x28
            .word           0x2222              #ldtLen-1=47
            .word           0x0
            .byte           0x0
            .byte           0x82
            .byte           0x17
            .byte           0x0

.org        512
