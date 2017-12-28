.include "/home/xx/myos/include/386scd.h"

.section .data

vgdtr:                                      #0
vgdtrLimit: .word           0x0
vgdtrBaseL: .word           0x0
vgttrBaseH: .word           0x0

igdtr:                                      #6
igdtrLimit: .word           0x0
igdtrBaseL: .word           0x0
igttrBaseH: .word           0x0

mgdtr:                                      #12
mgdtrLimit: .word           0x2f
mgdtrBaseL: .word           0x0
mgttrBaseH: .word           0x0

msw_v:      .word           0x0             #18
ldtr_v:     .word           0x0             #20
tr_v:       .word           0x0             #22
cr0_v:      .long           0x0             #24
cr3_v:      .long           0x0             #28
dr7_v:      .long           0x0             #32
test_rpl:   .word           0x0             #36

test1_sld:  .long           0x0             #38
test1_ard:  .long           0x0             #42
test1_slw:  .word           0x0             #46
test1_arw:  .word           0x0             #48
test1_rf:   .word           0x0             #50
test1_wf:   .word           0x0             #52

test2_sld:  .long           0x0             #54
test2_ard:  .long           0x0             #58
test2_slw:  .word           0x0             #62
test2_arw:  .word           0x0             #64
test2_rf:   .word           0x0             #66
test2_wf:   .word           0x0             #68

.org 512
