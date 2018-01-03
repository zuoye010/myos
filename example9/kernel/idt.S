.include "/home/xx/myos/include/386scd.h"

.section .data

idt:

.rept   13
            .word           0x8
            .word           0xa0
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr

gpGate:
            .word           0x00
            .word           0x88      
            .byte           0x0
            .byte           ATTaskGate
            .word           0x0

.rept   242
            .word           0x8
            .word           0xa0
            .byte           0x0
            .byte           AT386TGate
            .word           0x0
.endr
