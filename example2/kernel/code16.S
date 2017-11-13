.include "/home/ml/myos/include/386scd.h"

.code16
.section .text

xor         %si,%si
movw        $96,%di
movb        $7,%ah
movw        $16,%cx
AGain:
lodsb
addb        $0x31,%al
stosw
loop        AGain
movw        $8,%ax
movw        %ax,%ds
movw        %ax,%es
movw        %ax,%ss

movl        %cr0,%eax
andl        $0xFFFE,%eax
movl        %eax,%cr0
ljmp        $0x2040,$0x0

.org 512
