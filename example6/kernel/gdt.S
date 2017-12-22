.include "/home/xx/myos/include/386scd.h"

.section .data

gdt:
dummy:      .space          descSize
normal:
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
videoBuf:
            .word           0xffff
            .word           0x8000
            .byte           0xb
            .byte           ATDW
            .byte           0x0
            .byte           0x0
tempCode:
            .word           0xffff    
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
demoCode:
            .word           0x2e        #demoCodeLen-1
            .word           0x2080
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
demoData:
            .word           0x0         #demoDataLen-1
            .word           0x1080
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
demoStack:
            .word           0x3ff       #demoDataLen-1
            .word           0x9800
            .byte           0x0
            .byte           ATDWA
            .byte           0x0
            .byte           0x0
echoCode:
            .word           0x2b        #echoCodeLen-1
            .word           0x20a0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
echoData:
            .word           0x1         #echoDataLen-1
            .word           0x10a0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
TiCode:
            .word           0x68        #TiCodeLen-1
            .word           0x20c0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
TiData:
            .word           0x0         #TiDataLen-1
            .word           0x10c0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
otherCode:
            .word           0x1e        #TiCodeLen-1
            .word           0x20e0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
.org 512
