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
            .word           0x7fff
            .word           0x8000
            .byte           0xb
            .byte           ATDW
            .byte           0x0
            .byte           0x0
demoTss:                                #0x18
            .word           104         #demoTssLen-1=104
            .word           0x1080      
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
demoStack:                              #0x20
            .word           0x400 
            .word           0x9800      #?
            .byte           0x0
            .byte           ATDW
            .byte           D32
            .byte           0x0
demoCode:                               #0x28
            .word           0x12b       #demoCodeLen-1
            .word           0x2080      
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
tempCode:                               #0x30
            .word           0xffff    
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
toGdt:                                  #0x38
            .word           0xaf        #gdtLen-1
            .word           0x1060      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
toGpTss:                                #0x40
            .word           104         #gpTssLen-1
            .word           0x10a0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
toTestTss:                              #0x48
            .word           118         #testTssLen-1
            .word           0x10c0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
testTss:                                #0x50
            .word           118         #testTssLen-1
            .word           0x10c0
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
test1Stack:                             #0x58
            .word           0x400       #testTssLen-1
            .word           0x9940
            .byte           0x0
            .byte           ATDW+DPL1
            .byte           D32
            .byte           0x0
test1Code:                              #0x60
            .word           0x27
            .word           0x20c0
            .byte           0x0
            .byte           ATCE+DPL1
            .byte           D32
            .byte           0x0
test2Stack:                             #0x68
            .word           0x400       #testTssLen-1
            .word           0x9980
            .byte           0x0
            .byte           ATDW+DPL2
            .byte           D32
            .byte           0x0
test2Code:                              #0x70
            .word           0x27
            .word           0x20c0
            .byte           0x0
            .byte           ATCE+DPL2
            .byte           D32
            .byte           0x0
test3Stack:                             #0x78
            .word           0x400       #testTssLen-1
            .word           0x99c0
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           D32
            .byte           0x0
test3Code:                              #0x80
            .word           0x27
            .word           0x20c0
            .byte           0x0
            .byte           ATCE+DPL3
            .byte           D32
            .byte           0x0
gpTss:                                  #0x88
            .word           104         #gpTssLen-1
            .word           0x10a0
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
gpStack:                                #0x90
            .word           0x200       #testTssLen-1
            .word           0x9a00
            .byte           0x0
            .byte           ATDW
            .byte           D32
            .byte           0x0
gpCode:                                 #0x98
            .word           0x76
            .word           0x20a0
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
errCode:                                #0xa0
            .word           0x2c
            .word           0x20e0
            .byte           0x0
            .byte           ATCCOR
            .byte           D32
            .byte           0x0
testTask:                               #0xa8
            .word           0x0
            .word           0x50
            .byte           0x0
            .byte           ATTaskGate
            .word           0x0
.org 512
