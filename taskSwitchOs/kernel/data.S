.include "/home/xx/myos/include/386scd.h"

.section .data

vgdtr:                                      #   ---0
vgdtrLimit:     .word           231             #?
vgdtrBaseL:     .word           0x0
vgttrBaseH:     .word           0x0

vidtr:                                      #6  ---6
vidtrLimit:     .word           0x7FF
vidtrBaseL:     .word           0x0
vidtrBaseH:     .word           0x0

flag:           .byte           0x0         #1  ---12
index:          .word           0x0         #2  ---13
