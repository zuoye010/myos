.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0,%ax        #clear segment reg
movw        %ax,%ds
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs

movw        $0x20,%ax     #demoStackSel
movw        %ax,%ss
movl        $0x400,%esp

movw        $0x18,%ax     #demoTss
ltr         %ax

Jump16      0x28,0        #to demoCode rpl0     16

ToReal:
clts
movw        $0x8,%ax      #use normalSel to clear seg reg
movw        %ax,%ds
movw        %ax,%es
movw        %ax,%fs
movw        %ax,%gs
movw        %ax,%ss

movl        %cr0,%eax     #to real mode
andb        $0xFE,%al
movl        %eax,%cr0

Jump16      0x2040,0x4d   #jump to kernel.S

.org 512
