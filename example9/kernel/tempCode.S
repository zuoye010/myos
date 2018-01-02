.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0,%ax
movw        %ax,%ds
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs

movw        $0x20,%ax
movw        %ax,%ss
movl        $0x400,%esp

movw        $0x18,%ax
ltr         %ax

Jump16      0x28,0        #to demoCode rpl0     16

ToReal:
clts
movw        $0x8,%ax
movw        %ax,%ds
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs
movw        %ax,%ss

movl        %cr0,%eax
andb        $0xFE,%al
movl        %eax,%cr0
Jump16      0x2040,0x00         #?

.org 512
