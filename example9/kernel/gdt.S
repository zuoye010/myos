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
            .word           0x00        #demoTssLen-1=0x69
            .word           0x1080      
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
demoStack:                              #0x20
            .word           0xffff
            .word           0x0         #?
            .byte           0x0
            .byte           ATDW
            .byte           D32
            .byte           0x0
demoCode:                               #0x28
            .word           0x00        #demoCodeLen-1
            .word           0x2080      
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
tempCode:                               #0x30
            .word           0xffff    
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
toGdt:                                  #0x38
            .word           0x00        #gdtLen-1
            .word           0x1060      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
toGpTss:                                #0x40
            .word           0x00        #gpTssLen-1
            .word           0x10a0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
toTestTss:                              #0x48
            .word           0x00        #testTssLen-1
            .word           0x10c0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
testTss:                                #0x50
            .word           0x00        #testTssLen-1
            .word           0x10c0
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
toTestTss:                              #0x48
            .word           0x00        #testTssLen-1
            .word           0x10c0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
other:                                  #0x60
            .word           0x12        #otherCodeLen-1
            .word           0x2180
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
.org 512
