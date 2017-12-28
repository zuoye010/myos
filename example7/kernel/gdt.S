.include "/home/xx/myos/include/386scd.h"

.section .data

gdt:
dummy:      .space          descSize    #0x0
normal:                                 #0x8
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
videoBuf:                               #0x10
            .word           0xffff
            .word           0x8000
            .byte           0xb
            .byte           ATDW
            .byte           0x0
            .byte           0x0
tempCode:                               #0x18
            .word           0xffff    
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
demoCode:                               #0x20
            .word           0x8d        #demoCodeLen-1
            .word           0x2080      
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
demoLdt:                                #0x28
            .word           0x47        #demoLdtLen-1
            .word           0x1100      
            .byte           0x0
            .byte           ATLDT
            .byte           0x0
            .byte           0x0
demoTss:                                #0x30
            .word           0x69        #demoTssLen-1
            .word           0x1120      
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
buffer:                                 #0x38
            .word           0x80        #bufferLen-1
            .word           0x10e0      
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
gKeyLdt:                                #0x40
            .word           0xf         #gKeyLdtLen-1
            .word           0x10a0
            .byte           0x0
            .byte           ATLDT
            .byte           0x0
            .byte           0x0
gKeyTss:                                #0x48
            .word           0x69        #gKeyTssLen-1
            .word           0x10c0
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
echoCode:                               #0x50
            .word           0x1a        #echoCodeLen-1
            .word           0x20a0
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
subCode:                                #0x58
            .word           0x3c        #subCodeLen-1
            .word           0x20c0
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
other:                                  #0x60
            .word           0x12        #otherCodeLen-1
            .word           0x2180
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
.org 512
