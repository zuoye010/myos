.include "/home/ml/myos/include/386scd.h"

.code32
.section .text

call32      $(0x40+TIL),0

call32      $(0x38+TIL),0

.org 512
