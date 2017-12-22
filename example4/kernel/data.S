.include "/home/xx/myos/include/386scd.h"

.section .data

vgdtr:
vgdtrLimit: .word           47
vgdtrBaseL: .word           0x0
vgttrBaseH: .word           0x0

saveSp:     .word           0x00
saveSs:     .word           0x00

.org 512
