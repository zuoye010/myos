.include "/home/xx/myos/include/386scd.h"

.section .data

vgdtr:
vgdtrBaseL: .word           47
vgttrBaseH: .word           0x0
            .word           0x0

saveSp:     .word           0x00
saveSs:     .word           0x00

.org 512
