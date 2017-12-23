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
            .word           0x2e        #demoCodeLen-1
            .word           0x2080      
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
demoData:                               #0x28
            .word           0x0         #demoDataLen-1
            .word           0x1080      
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
demoStack:                              #0x30
            .word           0x3ff       #demoDataLen-1
            .word           0x9800      
            .byte           0x0
            .byte           ATDWA
            .byte           0x0
            .byte           0x0
echoCode:                               #0x38
            .word           0x2b        #echoCodeLen-1
            .word           0x20a0      
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
echoData:                               #0x40
            .word           0x1         #echoDataLen-1
            .word           0x10a0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
TiCode:                                 #0x48
            .word           0x68        #TiCodeLen-1
            .word           0x20c0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
TiData:                                 #0x50
            .word           0x0         #TiDataLen-1
            .word           0x10c0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
otherCode:                              #0x58
            .word           0x1e        #TiCodeLen-1
            .word           0x20e0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
.org 512
