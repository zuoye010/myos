.include "/home/xx/myos/include/386scd.h"

.section .data

ldt:
gKeyCode:
            .word           0xffff    #demoCodeLen-1
            .word           0x21a0
            .byte           0x0
            .byte           ATCE
            .byte           0x0 
            .byte           0x0
gKeyStack:
            .word           0x3ff     #gKeyStackLen-1
            .word           0x9900
            .byte           0x0
            .byte           ATDWA
            .byte           0x0
            .byte           0x0
