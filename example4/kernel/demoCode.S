.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

CALL32      (0x40+TIL),0

CALL32      (0x38+TIL),0

.org 512
