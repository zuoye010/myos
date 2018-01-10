.include "/home/xx/myos/include/386scd.h"

.section .data

ldt:
bCode:                                      #0x0+TIL
            .word           0x39            #aCodeLen-1
            .word           0x20e0
            .byte           0x0
            .byte           ATCE+DPL3
            .byte           D32
            .byte           0x0
bStack:                                     #0x8+TIL
            .word           0x200           #aStackLen-1
            .word           0x9b80
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           D32
            .byte           0x0
