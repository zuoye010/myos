.include "/home/xx/myos/include/386scd.h"

.section .data

mess0:      .ascii          "Divide Error (Exception 0)"
            .byte           0x0         #27 -----0

mess4:      .ascii          "Overflow (Exception 4)"
            .byte           0x0         #23 -----27

messb:      .ascii          "Segment Not Present (Exception 11)"
            .byte           0x0         #35 -----50

messc:      .ascii          "Stack Segment (Exception 12)"
            .byte           0x0         #29 -----85

messd:      .ascii          "General Protection (Exception 13)"
            .byte           0x0         #34 -----114

messOther:  .ascii          "Other Exception"
            .byte           0x0         #16 -----148

ErrMess:    .ascii          "Error Code="#11 -----164

ErrCode:    .long           0x0         #   -----175
            .byte           'H'
            .byte           0x0
.org 512
