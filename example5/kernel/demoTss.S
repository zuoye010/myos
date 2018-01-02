.include "/home/xx/myos/include/386scd.h"

.section .data
        .long       0x0             #back
        .long       0x200           #stack0Sp
        .long       (0x0+TIL)       #stack0Ss
        .long       0x0             #stack1Sp
        .long       0x0             #stack1Ss
        .long       0x0             #stack2Sp
        .long       0x0             #stack2Ss
        .long       0x0             #cr3
        .long       0x0             #eip
        .long       0x0             #eflags
        .long       0x0             #eax
        .long       0x0             #ecx
        .long       0x0             #edx
        .long       0x0             #ebx
        .long       0x200           #esp
        .long       0x0             #ebp
        .long       0x0             #esi
        .long       1986            #edi
        .long       0x10            #es
        .long       (0x10+TIL+RPL2) #cs
        .long       (0x08+TIL+RPL2) #ss
        .long       (0x18+TIL)      #ds
        .long       (0x20+TIL)      #fs
        .long       (0x28+TIL)      #gs
        .long       0x18            #ldt
        .word       0x0             #trace
        .word       0x68            #ioMap

        .byte       0xff            #ioMap end
.org 512
