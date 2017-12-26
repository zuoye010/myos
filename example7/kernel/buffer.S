.include "/home/xx/myos/include/386scd.h"

.section .data

keyAscii:       .byte           0x0

buffer:
.rept   128
                .byte           0x0
.endr

.org 512
