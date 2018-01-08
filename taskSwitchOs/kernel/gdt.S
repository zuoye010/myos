.include "/home/xx/myos/include/386scd.h"

.section .data

gdt:
dummy:      .space          descSize        #0x00
pdt:                                        #0x08
            .word           0xfff
            .word           0x0
            .byte           0x20
            .byte           ATDW
            .byte           0x0
            .byte           0x0
pt0:                                        #0x10
            .word           0xfff
            .word           0x1000
            .byte           0x20
            .byte           ATDW
            .byte           0x0
            .byte           0x0
data:                                       #0x18
            .word           15              #?
            .word           0x1040
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
toGdt:                                      #0x20
            .word           191             #gdtLen-1
            .word           0x1060      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
timeTss:                                    #0x28
            .word           104             #timeTssLen-1=104
            .word           0x1080      
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
toTimeTss:                                  #0x30
            .word           104             #timeTssLen-1
            .word           0x1080      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
osTss:                                      #0x38
            .word           104             #osTssLen-1=104
            .word           0x10a0      
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
toOsTss:                                    #0x40
            .word           104             #osTssLen-1
            .word           0x10a0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
aTss:                                       #0x48
            .word           104             #aTssLen-1=104
            .word           0x10c0      
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
toATss:                                     #0x50
            .word           104             #aTssLen-1
            .word           0x10c0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
bTss:                                       #0x58
            .word           104             #bTssLen-1=104
            .word           0x10e0      
            .byte           0x0
            .byte           AT386TSS
            .byte           0x0
            .byte           0x0
toBTss:                                     #0x60
            .word           104             #bTssLen-1
            .word           0x10e0      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
aLdt:                                       #0x68
            .word           0xf             #aLdtLen-1
            .word           0x1100      
            .byte           0x0
            .byte           ATLDT
            .byte           0x0
            .byte           0x0
toALdt:                                     #0x70
            .word           0xf             #aLdtLen-1
            .word           0x1100      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
bLdt:                                       #0x78
            .word           0xf             #bLdtLen-1
            .word           0x1120      
            .byte           0x0
            .byte           ATLDT
            .byte           0x0
            .byte           0x0
toBLdt:                                     #0x80
            .word           0xf             #bLdtLen-1
            .word           0x1120      
            .byte           0x0
            .byte           ATDW 
            .byte           0x0
            .byte           0x0
initPageCode:                               #0x88
            .word           0x6c            #?
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
timeCode:                                   #0x90
            .word           0x9             #?
            .word           0x2080
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
osCode:                                     #0x98
            .word           0x34            #?
            .word           0x20a0
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
otherCode:                                  #0xa0
            .word           0x0             #?
            .word           0x2100
            .byte           0x0
            .byte           ATCE
            .byte           D32
            .byte           0x0
timeStack:                                  #0xa8
            .word           0x200           #timeStackLen-1
            .word           0x9900
            .byte           0x0
            .byte           ATDW
            .byte           D32
            .byte           0x0
osStack:                                    #0xb0
            .word           0x200           #timeStackLen-1
            .word           0x9800
            .byte           0x0
            .byte           ATDW
            .byte           D32
            .byte           0x0
videoBuffer:                                #0xb8
            .word           3999            #timeStackLen-1
            .word           0xb800
            .byte           0x0
            .byte           ATDW+DPL3
            .byte           0x0
            .byte           0x0
.org 512
