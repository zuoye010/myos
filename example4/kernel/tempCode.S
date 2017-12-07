.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $24,%ax
ltr         %ax 

movw        $32,%ax
lldt        %ax 

Jump16      0x30,0 

ToReal:
movw        $0x8,%ax
movw        %ax,%ds
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs
movw        %ax,%ss

movl        %cr0,%eax
andb        $0xFE,%al
movl        %eax,%cr0
Jump16      0x2040,0xaa

.org 512
