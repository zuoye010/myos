.include "/home/xx/myos/include/386scd.h"

.section .data
.rept   104
        .byte       0x00
.endr
        .byte       0xff          #ioMap end
.org 512
