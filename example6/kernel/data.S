.include "/home/xx/myos/include/386scd.h"

.section .data

vgdtr:
vgdtrBaseL: .word           47
vgdtrBaseH: .word           0x0
            .word           0x0

igdtr:
igdtrBaseL: .word           47
igdtrBaseH: .word           0x0
            .word           0x0

saveSp:     .word           0x00
saveSs:     .word           0x00

.org 512
