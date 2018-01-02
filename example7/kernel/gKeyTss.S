.include "/home/xx/myos/include/386scd.h"

.section .data
        .long       0x0             #back
        .long       0x0             #stack0Sp
        .long       0x0             #stack0Ss
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
        .long       0x400           #esp
        .long       0x0             #ebp
        .long       0x0             #esi
        .long       0x0             #edi
        .long       0x8             #es
        .long       (0x0+TIL)       #cs
        .long       (0x8+TIL)       #ss
        .long       0x8             #ds
        .long       0x8             #fs
        .long       0x8             #gs
        .long       0x40            #ldt
        .word       0x0             #trace
        .word       0x68            #ioMap

        .byte       0xff            #ioMap end
.org 512
