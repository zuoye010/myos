.include "/home/xx/myos/include/386scd.h"

.section .data

vgdtr:
vgdtrLimit:     .word           103         #   ---0
vgdtrBaseL:     .word           0x0
vgdtrBaseH:     .word           0x0

vidtr:                                      #6  ---6
vidtrLimit:     .word           0x7FF
vidtrBaseL:     .word           0x0
vidtrBaseH:     .word           0x0

norVidtr:                                   #6  ---12
norVidtrLimit:  .word           0x3FF
norVidtrBaseL:  .word           0x0
norVidtrBaseH:  .word           0x0

saveSp:         .word           0x00        #4  ---18
saveSs:         .word           0x00

                                            #   ---22
mess:           .ascii          "Press a key[0,4,B,C,D]:$"
                .byte           0x0

.org 512
