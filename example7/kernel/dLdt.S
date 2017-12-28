.include "/home/xx/myos/include/386scd.h"

.section .data

ldt:
toDemoTss:                          #0x0+TIL
            .word           0x69    #demoTssLen-1
            .word           0x1120
            .byte           0x0
            .byte           ATDW
            .byte           0x0 
            .byte           0x0
demoStack:                          #0x8+TIL
            .word           0x3ff   #stackLen-1
            .word           0x9800
            .byte           0x0
            .byte           ATDWA
            .byte           0x0
            .byte           0x0
demoData:                           #0x10+TIL
            .word           180     #stackLen-1=180
            .word           0x1140
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
divide:                             #0x18+TIL
            .word           0x14    #demoCodeLen-1
            .word           0x2160
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
overFlow:                           #0x20+TIL
            .word           0xc     #demoCodeLen-1
            .word           0x2140
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
snpCode:                            #0x28+TIL
            .word           0x19    #demoCodeLen-1
            .word           0x2120
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
sseCode:                            #0x30+TIL
            .word           0x19    #demoCodeLen-1
            .word           0x2100
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
gpCode:                             #0x38+TIL
            .word           0x32    #demoCodeLen-1
            .word           0x20e0
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
testNps:                            #0x40+TIL
            .word           0xffff  #demoCodeLen-1
            .word           0x0   
            .byte           0x0
            .byte           ATDW-0x80
            .byte           D32
            .byte           0x0
