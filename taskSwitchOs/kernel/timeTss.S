.include "/home/xx/myos/include/386scd.h"

.section .data
        .long       0x0         #back           #0
        .long       0x0         #stack0Sp       #4
        .long       0x0         #stack0Ss       #8
        .long       0x0         #stack1Sp       #12
        .long       0x0         #stack1Ss       #16
        .long       0x0         #stack2Sp       #20
        .long       0x0         #stack2Ss       #24
        .long       0x200000    #cr3            #28
        .long       0x0         #eip            #32
        .long       0x0         #eflags         #36
        .long       0x0         #eax            #40
        .long       0x0         #ecx            #44
        .long       0x0         #edx            #48
        .long       0x0         #ebx            #52
        .long       0x200       #esp            #56
        .long       0x0         #ebp            #60
        .long       0x0         #esi            #64
        .long       0x0         #edi            #68
        .long       0x8         #es             #72
        .long       0xa0        #cs             #76
        .long       0xb8        #ss             #80
        .long       0x40        #ds             #84
        .long       0x8         #fs             #88
        .long       0x8         #gs             #92
        .long       0x0         #ldt            #96
        .word       0x0         #trace          #100
        .word       104         #ioMap          #102

        .byte       0xff        #ioMap end      #104
.org 512                                        #105
