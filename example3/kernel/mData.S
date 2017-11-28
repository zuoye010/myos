.include "/home/ml/myos/include/386scd.h"

.section .data

message:    .ascii      "Value="
            .byte       0
buffer:     .fill 80,1,0
            .byte       0

.org 512
