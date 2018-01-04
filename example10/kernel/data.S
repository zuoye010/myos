.include "/home/xx/myos/include/386scd.h"

.section .data

mess:       .ascii      "Page is OK!"               #11

vgdtr:
vgdtrLimit: .word           95
vgdtrBaseL: .word           0x0
vgttrBaseH: .word           0x0

.org 512
