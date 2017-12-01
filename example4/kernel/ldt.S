.include "/home/ml/myos/include/386scd.h"

.section .data

ldt:
stack0:      
            .word           511     #stackLen-1
            .word           0x9800
            .byte           0x0
            .byte           ATDW+DPL0
            .byte           D32
            .byte           0x0
stack1:      
            .word           511     #stackLen-1
            .word           0x9820
            .byte           0x0
            .byte           ATDW+DPL1
            .byte           D32
            .byte           0x0
stack3:      
            .word           511     #stackLen-1
            .word           0x9860
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           0x0
            .byte           0x0
demoCode:
            .word           0x6a    #codeLLen-1
            .word           0x20a0
            .byte           0x0
            .byte           ATCE+DPL3
            .byte           D32
            .byte           0x0
t32Code:
            .word           0x2e    #codeCLen-1
            .word           0x2080
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
echoSub:
            .word           0x2e    #codeCLen-1
            .word           0x20c0
            .byte           0x0
            .byte           ATCE+DPL1
            .byte           D32
            .byte           0x0

toT32GateA:
.org 512
