.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x28,%ax
ltr         %ax 

Jump16      0x20,0        #to demoCode rpl2     32

clts
movl        %cr0,%eax
andb        $0xFE,%al
movl        %eax,%cr0
Jump16      0x2040,0x4f

.org 512
