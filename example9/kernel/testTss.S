.include "/home/xx/myos/include/386scd.h"

.section .data
.rept   104                         #tss
        .byte       0x00
.endr

.rept   8                           #ioMap
        .byte       0xff
.endr

        .byte       0xfb

.rept   3
        .byte       0xff
.endr

        .byte       0xfd

        .byte       0x0

        .byte       0xff            #end of ioMap

.org 512
