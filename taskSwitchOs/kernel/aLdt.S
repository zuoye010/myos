.include "/home/xx/myos/include/386scd.h"

.section .data

ldt:
aCode:                              #0x0+TIL
            .word           0x00    #aCodeLen-1
            .word           0x20c0
            .byte           0x0
            .byte           ATCE+DPL3
            .byte           D32
            .byte           0x0
aStack:                             #0x8+TIL
            .word           0x200   #aStackLen-1
            .word           0x9a80
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           0x0
            .byte           0x0
