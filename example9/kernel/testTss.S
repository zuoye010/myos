.include "/home/xx/myos/include/386scd.h"

.section .data
        .org        104

.rept   8
        .byte       0xff
.endr

        .byte       0xfb

.rept   3
        .byte       0xff
.endr

        .byte       0xfd

        .byte       0x0

        .byte       0xff

.org 512
