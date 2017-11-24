.include "/home/ml/myos/include/386scd.h"

.code16
.section .text

movw        $24,%ax
lldt        %ax 

movw        $(40+TIL),%ax
movw        %ax,%ss
movw        $0x100,%sp
Jump16      0x0+TIL,0x0
vir3:
movw        0x8,%ax
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs
movw        %ax,%ss

movl        %cr0,%eax
andb        $0xFE,%al
movl        %eax,%cr0
Jump16      0x2040,0xaa

.org 512
