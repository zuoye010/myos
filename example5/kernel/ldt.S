.include "/home/xx/myos/include/386scd.h"

.section .data

ldt:
stack0:      
            .word           511     #stackLen-1
            .word           0x9800
            .byte           0x0
            .byte           ATDW
            .byte           D32
            .byte           0x0
stack2:      
            .word           511     #stackLen-1
            .word           0x9840
            .byte           0x0
            .byte           ATDW+DPL2
            .byte           D32
            .byte           0x0
demoCode:
            .word           0x5a    #demoCodeLen-1
            .word           0x2080
            .byte           0x0
            .byte           ATCE+DPL2
            .byte           D32
            .byte           0x0
demoData:
            .word           0x6     #t32CodeLen-1
            .word           0x10e0
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           D32
            .byte           0x0
toDLdt:
            .word           0x3f    #ldtLen-1
            .word           0x1080
            .byte           0x0
            .byte           ATDW+DPL2
            .byte           0x0 
            .byte           0x0
toTTss:
            .word           0x69    #ldtLen-1
            .word           0x10a0
            .byte           0x0
            .byte           ATDW+DPL2
            .byte           0x0 
            .byte           0x0
toSubR:
            .word           0x0
            .word           0x38
            .byte           0x0
            .byte           AT386CGate+DPL3
            .word           0x0
toTempT:
            .word           0x0
            .word           0x28
            .byte           0x0
            .byte           ATTaskGate+DPL3
            .word           0x0

