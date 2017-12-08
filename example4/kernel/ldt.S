.include "/home/xx/myos/include/386scd.h"

.section .data

ldt:
stack0:      
            .word           511     #stackLen-1
            .word           0x9800
            .byte           0x0
            .byte           ATDW+DPL0
            .byte           D32
            .byte           0x0
stack1:      
            .word           511     #stackLen-1
            .word           0x9820
            .byte           0x0
            .byte           ATDW+DPL1
            .byte           D32
            .byte           0x0
stack3:      
            .word           511     #stackLen-1
            .word           0x9860
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           0x0
            .byte           0x0
demoCode:
            .word           0xd     #demoCodeLen-1
            .word           0x20a0
            .byte           0x0
            .byte           ATCE+DPL3
            .byte           D32
            .byte           0x0
t32Code:
            .word           0x1b    #t32CodeLen-1
            .word           0x2080
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
echoSub:
            .word           0x3a    #echoSubLen-1
            .word           0x20c0
            .byte           0x0
            .byte           ATCER+DPL1
            .byte           D32
            .byte           0x0

toT32GateA:
            .word           0x0
            .word           0x20+TIL
            .byte           0x0
            .byte           AT386CGate
            .word           0x0

toT32GateB:
            .word           0x17
            .word           0x20+TIL
            .byte           0x0
            .byte           AT386CGate+DPL3
            .word           0x0

toEchoGate:
            .word           0x5
            .word           0x28+TIL+RPL3
            .byte           0x0
            .byte           AT386CGate+DPL3
            .word           0x0
.org 512
