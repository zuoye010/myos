.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

timeBegin:
cli 
CALL32      0x38,0x0 
jmp         timeBegin

.org 512
