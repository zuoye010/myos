.include "/home/xx/myos/include/386scd.h"

.section .data

gdt:
dummy:      .space          descSize        #0
normal:                                     #8
            .word           0xffff
            .word           0x0
            .byte           0x0
            .byte           ATDW
            .byte           0x0
            .byte           0x0
pdt:                                        #10
            .word           0xfff
            .word           0x0
            .byte           0x20
            .byte           ATDW
            .byte           0x0
            .byte           0x0
pt0:                                        #18
            .word           0xfff
            .word           0x2000
            .byte           0x20
            .byte           ATDW
            .byte           0x0
            .byte           0x0
pt1:                                        #20
            .word           0xfff
            .word           0x1000
            .byte           0x20
            .byte           ATDW
            .byte           0x0
            .byte           0x0
loVideo:                                    #28
            .word           3999
            .word           0x0
            .byte           0xf
            .byte           ATDW
            .byte           0x0
            .byte           0x0
loCode:                                     #30
            .word           0x0             #?
            .word           0x2000
            .byte           0x40
            .byte           ATCE
            .byte           0x0
            .byte           0x0
tpsCode:                                    #38
            .word           0x0             #?
            .word           0x3000
            .byte           0x30
            .byte           ATDW
            .byte           0x0
            .byte           0x0
tempCode:                                   #40
            .word           0xffff    
            .word           0x2060
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
demoCode:                                   #48
            .word           0x0             #?
            .word           0x2080
            .byte           0x0
            .byte           ATCE
            .byte           0x0
            .byte           0x0
demoDdata:                                  #50
            .word           10
            .word           0x0
            .byte           0x1040
            .byte           ATDW
            .byte           0x0
            .byte           0x0
sCode:                                      #58
            .word           0x0             #?
            .word           0x0
            .byte           0x20a0
            .byte           ATDR
            .byte           0x0
            .byte           0x0
.org 512
