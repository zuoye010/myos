.include "/home/xx/myos/include/386scd.h"

.section .data

vgdtr:
vgdtrLimit:     .word           95
vgdtrBaseL:     .word           0x0
vgdtrBaseH:     .word           0x0

vidtr:
vidtrLimit:     .word           0x7FF
vidtrBaseL:     .word           0x0
vidtrBaseH:     .word           0x0

norVidtr:
norVidtrLimit:  .word           0x3FF
norVidtrBaseL:  .word           0x0
norVidtrBaseH:  .word           0x0

saveSp:         .word           0x00
saveSs:         .word           0x00

iMaskRegV:      .byte           0x0

.org 512
