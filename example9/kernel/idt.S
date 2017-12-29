.include "/home/xx/myos/include/386scd.h"

.section .data

idt:

divGate:
            .word           0x00
            .word           (0x18+TIL)
            .byte           0x0
            .byte           AT386TGate
            .word           0x0

.rept   3
            .word           0x0
            .word           0x60
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr

ofGate:
            .word           0x00
            .word           (0x20+TIL)
            .byte           0x0
            .byte           AT386TGate
            .word           0x0

.rept   6
            .word           0x0
            .word           0x60
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr

snpGate:
            .word           0x0
            .word           (0x28+TIL)
            .byte           0x0
            .byte           AT386TGate
            .word           0x0

sseGate:
            .word           0x0
            .word           (0x30+TIL)
            .byte           0x0
            .byte           AT386TGate
            .word           0x0

gpGate:
            .word           0x0
            .word           (0x38+TIL)
            .byte           0x0
            .byte           AT386TGate
            .word           0x0

.rept   240 
            .word           0x0
            .word           0x60
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr

echoGate:
            .word           0x0
            .word           0x50
            .byte           0x0
            .byte           AT386TGate
            .word           0x0

gKeyGate:
            .word           0x0
            .word           0x48
            .byte           0x0
            .byte           ATTaskGate
            .word           0x0
