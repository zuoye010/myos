.include "/home/xx/myos/include/386scd.h"

.section .data

idt:

.rept   8
            .word           0x0
            .word           0xb0
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr

timeGate:
            .word           0x0
            .word           0x38
            .byte           0x0
            .byte           ATTaskGate
            .word           0x0

.rept   247 
            .word           0x0
            .word           0xb0
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr
