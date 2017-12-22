.include "/home/xx/myos/include/386scd.h"

.section .data

idt:
.rept   8
            .word           0x0
            .word           0x58
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr

timeGate:
            .word           0x0
            .word           0x48
            .byte           0x0
            .byte           AT386IGate
            .word           0x0

.rept   245 
            .word           0x0
            .word           0x58
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr

echoGate:
            .word           0x0
            .word           0x38
            .byte           0x0
            .byte           AT386TGate
            .word           0x0

otherGate:
            .word           0x0
            .word           0x58
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
