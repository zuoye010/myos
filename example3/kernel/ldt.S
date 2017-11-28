.include "/home/ml/myos/include/386scd.h"

.section .data

ldt:
codeL:
            .word           0x60    #codeLLen-1
            .word           0x2080
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
codeC:
            .word           0x2e    #codeCLen-1
            .word           0x20a0
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
videoBuf:      
            .word           0xffff 
            .word           0xb800
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
toLdt:      
            .word           0x2f    #ldtLen-1=47
            .word           0x1080
            .byte           0x0
            .byte           ATDR+DPL3
            .byte           0x0
            .byte           0x0
mData:      
            .word           0x56     #ldtLen-1
            .word           0x10a0
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           0x0
            .byte           0x0
stackS:      
            .word           255     #stackLen-1
            .word           0x9800
            .byte           0x0
            .byte           ATDWA
            .byte           0x0
            .byte           0x0

.org 512
